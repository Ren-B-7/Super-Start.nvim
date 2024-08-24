local DEBUG = vim.log.levels.debug
local INFO = vim.log.levels.info
local TRACE = vim.log.levels.trace
local WARN = vim.log.levels.warn
local ERROR = vim.log.levels.error
local OFF = 0

local notify = function(message, log)
	local out = log ~= OFF and vim.notify(message, log) or nil
end

local api = vim.api
local cmd = vim.cmd

local set_opts = api.nvim_set_option_value
local get_opts = api.nvim_get_option_value

local utils = {}

utils.toggle_list_and_col = function(log)
	log = log == OFF and OFF or INFO
	notify("Toggle column and list", log)
	utils.toggle_list(OFF)
	utils.toggle_colorcol(OFF)
end

utils.toggle_colorcol = function(log)
	log = log == OFF and OFF or INFO
	notify("Toggle colorcolumn", log)

	local val = (get_opts("colorcolumn", {}) == "" and "80" or "")
	set_opts("colorcolumn", val, {})
end

utils.toggle_list = function(log)
	log = log == OFF and OFF or INFO
	notify("Toggle list", log)
	cmd("set list!")
end

utils.toggle_modifiable = function(log)
	log = log == OFF and OFF or INFO
	notify("Toggle modifiable", log)

	cmd("setlocal modifiable!")
end

utils.reload_nvim_tree = function(log)
	log = log == OFF and OFF or INFO
	notify("Reload Nvim Tree", log)

	require("nvim-tree.api").tree.open()
	require("nvim-tree.api").tree.reload()
	require("nvim-tree.api").tree.focus()
end

return utils
