local cmd = vim.cmd
local m = {}

local close_all_buffers_command = function()
	cmd(":command Bda :%bd")
end

local toggle_auto_format = function()
	cmd(":command TF :lua require('utils.functions').toggle_format_on_save(0)")
end

local updatecmd = function()
	cmd(":command EasyUpdate :lua require('utils.easy_lsp').update(true); vim.print('Update ran')")
end

m.start = function()
	close_all_buffers_command()
	toggle_auto_format()
	updatecmd()
end

return m
