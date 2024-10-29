local utils = require("utils.functions")
local registry = require("mason-registry")
local cmd = vim.cmd

---@class server_info
---@field name string name
---@field priority integer priority set (auto or user set)
---@field type table of server/ capabilities
---@field lang table affected languages
---@field filetype table affected file types

local public = {}

local dir_path = vim.fn.stdpath("data")

local file_providers = dir_path .. "/easy_lsp_providers.json"
local file_ft = dir_path .. "/easy_lsp_ft.json"
local file_match = dir_path .. "/easy_lsp_match.json"

local msn_to_cfg = require("mason-lspconfig").get_mappings()
-- config to mason [lspconfig_to_mason]
-- mason to config [mason_to_lspconfig]

local pack_json = function(file_pos, data_table)
	file_pos = file_pos or "/dev/null"
	-- Creates the json object and saves to file
	local file = io.open(file_pos, "w") or nil
	if not (file and data_table) then
		return
	end
	file:write(vim.json.encode(data_table))
	file:close()
end

local unpack_json = function(file_pos)
	-- Unpacks the json data into lua table
	file_pos = file_pos or "/dev/null"
	local file = io.open(file_pos, "r")
	if not file then
		return {}
	end
	local data = file:read("*a") or ""
	file:close()

	return vim.json.decode(data, { object = true, array = true })
end

local pack_server_info = function(p_name, p_priority, p_server_type, p_server_lang, p_file_type)
	return { name = p_name, priority = p_priority, type = p_server_type, lang = p_server_lang, filetype = p_file_type }
end

-- local potential_types = { "LSP", "Formatter", "DAP", "Linter", "Runtime", "Compiler" }
-- local provider_json = unpack_json(file_providers) or {}
local provider_json
local ft_json = unpack_json(file_ft) or {}
local match_lang = unpack_json(file_match) or {}

local __determine_priority = function(server_data)
	local MAX = 10 -- max that can be set here will be 10
	local counter = 0
	for _, _ in pairs(server_data.type) do
		counter = counter + 1
	end
	local priority = counter == 1 and 7 or 5

	priority = priority
		+ ((vim.tbl_contains(server_data.type, "LSP") or vim.tbl_contains(server_data.type, "Formatter")) and 1 or 0)

	return (priority > MAX) and MAX or priority
end

local __create_type_lists = function()
	if not provider_json then
		provider_json = unpack_json(file_providers) or {}
	end
	local type_file_list = {}

	for _, server in pairs(provider_json) do
		for _, category in pairs(server.type) do
			type_file_list[category] = type_file_list[category] or {}
			for _, ft in pairs(server.filetype) do
				type_file_list[category][ft] = type_file_list[category][ft] or {}
				table.insert(type_file_list[category][ft], server.name)
			end
		end
	end

	pack_json(file_ft, type_file_list)
	ft_json = type_file_list
end

local __add_filetype_from_lang = function(lang)
	local tbl = {}
	for _, types in pairs(vim.treesitter.language.get_filetypes(lang)) do
		table.insert(tbl, types)
	end
	return tbl
end

local __create_ft_from_treesitter = function(languages)
	local ft = {}

	for _, base_lang in pairs(languages) do
		base_lang = string.lower(base_lang)
		ft = vim.tbl_extend("keep", ft, __add_filetype_from_lang(base_lang))

		for _, langs in ipairs(match_lang[base_lang] or {}) do
			ft = vim.tbl_extend("keep", ft, __add_filetype_from_lang(langs))
		end
	end

	return ft
end

local __create_entry = function(package_name)
	-- Gets name, priority, server_types, filetypes and custom_commands
	if not provider_json then
		provider_json = unpack_json(file_providers) or {}
	end

	local msn_name = msn_to_cfg["lspconfig_to_mason"][package_name] or package_name

	local categories = {}
	local languages = {}
	local filetype = {}

	if registry.has_package(msn_name) then
		local mason_def = registry.get_package(msn_name).spec
		local generated_ft = {}
		local ft = {}

		categories = mason_def.categories or {}
		languages = mason_def.languages or {}

		if require("lspconfig")[package_name].config_def then
			ft = require("lspconfig")[package_name].config_def.default_config.filetypes or {}
		end
		generated_ft = vim.tbl_extend("keep", ft, __create_ft_from_treesitter(languages))

		filetype = vim.tbl_extend("keep", generated_ft, vim.tbl_get(provider_json, "package_name", "filetype") or {})
	end

	return pack_server_info(package_name, 0, categories, languages, filetype)
end

local __sort = function(a, b)
	if a.priority ~= b.priority then
		return a.priority > b.priority -- Higher priority first
	end
	return a.name < b.name -- Alphabetical order if priorities are equal
end

public.update = function(forced)
	if not provider_json then
		provider_json = unpack_json(file_providers) or {}
	end

	forced = forced or false

	for _, name in ipairs(registry.get_installed_package_names()) do
		name = msn_to_cfg["mason_to_lspconfig"][name] or name
		-- Mason registry names
		if forced or not vim.tbl_contains(provider_json, name) then
			local server_info = __create_entry(name)

			server_info.priority = vim.tbl_get(provider_json, name, "priority") or __determine_priority(server_info)
			provider_json[name] = server_info
		end
	end
	table.sort(provider_json, __sort)
	pack_json(file_providers, provider_json)
end

public.type_update = function(forced)
	forced = forced or false

	if forced or vim.tbl_isempty(ft_json) then
		__create_type_lists()
	end
end

public.set_priority = function(p_name, priority)
	if not provider_json then
		provider_json = unpack_json(file_providers) or {}
	end

	if not (p_name and provider_json and provider_json[p_name] and priority) then
		utils.notify("invalid registry name", utils.ERROR)
		return
	end

	priority = vim.fn.str2nr(priority)

	priority = (priority > -1) and priority or provider_json[p_name]
	provider_json[p_name].priority = priority

	table.sort(provider_json, __sort)
	pack_json(file_providers, provider_json)
end

public.add_filetype = function(p_name, file_type_name)
	if not (p_name and file_type_name) then
		utils.notify("Invalid registry name or file type")
		return
	end
	file_providers[p_name].filetype = vim.tbl_extend("keep", file_providers[p_name].filetype, { file_type_name })
end

public.match_language = function(language_name, mapped_value)
	if not (language_name and mapped_value and match_lang) then
		utils.notify("Invalid language name/ names")
		return
	end

	match_lang[language_name] = vim.tbl_extend("keep", match_lang[language_name] or {}, { mapped_value })

	pack_json(file_match, match_lang)
end

public.get_type = function(server_type)
	-- get all with set server type (lsp/format/...)
	-- ft_json
	ft_json = ft_json or {}

	if not (server_type and ft_json) then
		utils.notify("invalid server type or filetype json", utils.ERROR)
		return
	end

	public.type_update(false)

	return ft_json[server_type] or {}
end

public.get_server = function(package_name)
	if not provider_json then
		provider_json = unpack_json(file_providers) or {}
	end

	if not (package_name and provider_json) then
		utils.notify("invalid package name or json file", utils.ERROR)
		return {}
	end

	return provider_json[package_name] or {}
end

public.get_all = function()
	if not provider_json then
		provider_json = unpack_json(file_providers) or {}
	end

	return provider_json or {}
end

public.get_all_server_names = function()
	if not provider_json then
		provider_json = unpack_json(file_providers) or {}
	end

	return vim.tbl_keys(provider_json) or {}
end

public.__personal = function()
	local temp = {
		{ name = "spyglassmc-language-server", value = 50 },
		{ name = "quick_lint_js", value = 50 },
		{ name = "pylyzer", value = 50 },
		{ name = "clang-format", value = 50 },
		{ name = "zls", value = 50 },
		{ name = "asm_lsp", value = 45 },
		{ name = "lua_ls", value = 45 },
		{ name = "luacheck", value = 45 },
		{ name = "cpplint", value = 45 },
		{ name = "yamllint", value = 45 },
		{ name = "bacon", value = 45 },
		{ name = "black", value = 45 },
		{ name = "cmakelang", value = 45 },
		{ name = "clangd", value = 42 },
		{ name = "stylua", value = 40 },
		{ name = "neocmake", value = 40 },
		{ name = "rust_analyzer", value = 40 },
		{ name = "basedpyright", value = 40 },
		{ name = "html", value = 40 },
		{ name = "selene", value = 40 },
		{ name = "java_language_server", value = 35 },
		{ name = "bacon-ls", value = 35 },
		{ name = "vimls", value = 35 },
		{ name = "yamlls", value = 35 },
		{ name = "prettierd", value = 35 },
		{ name = "beautysh", value = 35 },
		{ name = "bibtex-tidy", value = 35 },
		{ name = "cssls", value = 30 },
		{ name = "htmx", value = 25 },
		{ name = "ltex", value = 20 },
		{ name = "dprint", value = 15 },
		{ name = "ast_grep", value = 5 },
		{ name = "textlsp", value = 5 },
		{ name = "typos_lsp", value = 5 },
	}

	for _, a in pairs(temp) do
		public.set_priority(a.name, a.value)
	end
end

return public
