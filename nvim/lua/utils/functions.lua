local DEBUG = vim.log.levels.debug
local INFO = vim.log.levels.info
local TRACE = vim.log.levels.trace
local WARN = vim.log.levels.warn
local ERROR = vim.log.levels.error
local OFF = vim.log.levels.off

local notify = vim.notify

local api = vim.api
local cmd = vim.cmd

local set_opts = api.nvim_set_option_value
local get_opts = api.nvim_get_option_value

local utils = {}

utils.toggle_list_and_col = function(message)
	message = message or INFO
	notify("Toggle column and list", message)

	utils.toggle_list(OFF)
	utils.toggle_colorcol(OFF)
end

utils.toggle_colorcol = function(message)
	message = message or INFO
	notify("Toggle colorcolumn", message)

	local val = (get_opts("colorcolumn", {}) == "" and "80" or "")
	set_opts("colorcolumn", val, {})
end

utils.toggle_list = function(message)
	message = message or INFO
	notify("Toggle list", message)
	cmd("set list!")
end

utils.toggle_modifiable = function(message)
	message = message or INFO
	notify("Toggle modifiable", message)

	cmd("setlocal modifiable!")
end

utils.reload_nvim_tree = function(message)
	message = message or INFO
	notify("Reload Nvim Tree", message)

	require("nvim-tree.api").tree.open()
	require("nvim-tree.api").tree.reload()
	require("nvim-tree.api").tree.focus()
end

return utils
