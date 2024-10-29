local cmp = require("cmp")
local function cmd()
	local cmd_line_options = { ":", "/", "?" }
	local cmd_line_commands = {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "cmdline", max_item_count = 5, group_index = 1 },
			{ name = "async_path", max_item_count = 5, group_index = 1 },
		}),
	}

	cmp.setup.cmdline(cmd_line_options, cmd_line_commands)
end
local function global()
	local auto_pairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", auto_pairs.on_confirm_done())

	local enabled = function()
		-- disabled completion in comments
		local context = require("cmp.config.context")
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end

	return {
		enabled = enabled(),
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` user.
			end,
		},
		completion = { completeopt = "menu, menuone, noselect" },
		preselect = cmp.PreselectMode.None,
		window = {
			completion = {
				scrollbar = true,
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
				col_offset = -3,
				side_padding = 0,
			},
			documentation = { winhighlight = "Normal:CmpDoc,FloatBorder:NormalFloat" },
		},
		view = {
			entries = { name = "custom", selection_order = "near_cursor", follow_cursor = false },
			docs = { auto_open = true },
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50, preset = "default" })(
					entry,
					vim_item
				)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				kind.kind = " " .. (strings[1] or "") .. " "
				kind.menu = "    (" .. (strings[2] or "") .. ")"

				return kind
			end,
		},
		mapping = {
			["<leader>do"] = cmp.mapping.open_docs(),
			["<leader>dc"] = cmp.mapping.close_docs(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp", max_item_count = 10, group_index = 1 },
			{ name = "nvim_lua", max_item_count = 5, group_index = 1 },
			{ name = "buffer", max_item_count = 5, group_index = 2 },
			{ name = "luasnip", max_item_count = 5, group_index = 2 }, -- For luasnip users.
			{ name = "cmdline", max_item_count = 5, group_index = 3 },
			{ name = "async_path", max_item_count = 2, group_index = 3 },
			{
				name = "spell",
				max_item_count = 5,
				group_index = 3,
			},
		}),
		experimental = {
			ghost_text = true,
		},
		performance = {
			max_view_entries = 15,
		},
	}
end

local function setup()
	cmp.setup(global())
	cmp.setup.cmdline(cmd())
end
return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"L3MON4D3/LuaSnip",
		"neovim/nvim-lspconfig",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"FelipeLema/cmp-async-path",
		"f3fora/cmp-spell",
		"windwp/nvim-autopairs",
		"onsails/lspkind.nvim",
	},
	setup = setup(),
}
