local cmd = vim.cmd
local m = {}

m.start = function()
	m.close_all_buffers_command()
	m.toggle_auto_format()
end

m.close_all_buffers_command = function()
	cmd(":command Bda :%bd|e#")
end

m.toggle_auto_format = function()
	cmd(":command TF :lua require('utils.functions').toggle_format_on_save()")
end
return m
