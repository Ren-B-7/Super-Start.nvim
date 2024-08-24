local api = vim.api
local cmd = vim.cmd
local log = vim.log
local fn = vim.fn

local set_opts = api.nvim_set_option_value
local get_opts = api.nvim_get_option_value

local utils = {}

utils.DEBUG = log.levels.debug
utils.INFO = log.levels.info
utils.TRACE = log.levels.trace
utils.WARN = log.levels.warn
utils.ERROR = log.levels.error
utils.OFF = 0

utils.notify = function(message, log)
	local out = log ~= utils.OFF and vim.notify(message, log) or nil
end

utils.toggle_list_and_col = function(log)
	log = log or utils.INFO
	utils.notify("Toggle column and list", log)
	utils.toggle_list(utils.OFF)
	utils.toggle_colorcol(utils.OFF)
end

utils.toggle_colorcol = function(log)
	log = log or utils.INFO
	utils.notify("Toggle colorcolumn", log)

	local val = (get_opts("colorcolumn", {}) == "" and tostring(fn.wincol()) or "")
	set_opts("colorcolumn", val, {})
end

utils.toggle_list = function(log)
	log = log or utils.INFO
	utils.notify("Toggle list", log)
	cmd("set list!")
end

utils.toggle_modifiable = function(log)
	log = log or utils.INFO
	utils.notify("Toggle modifiable", log)

	cmd("setlocal modifiable!")
end

utils.reload_nvim_tree = function(log)
	log = log or utils.INFO
	utils.notify("Reload Nvim Tree", log)

	require("nvim-tree.api").tree.open()
	require("nvim-tree.api").tree.reload()
	require("nvim-tree.api").tree.focus()
end

return utils
