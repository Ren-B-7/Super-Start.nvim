local cmd = vim.cmd
local m = {}

m.start = function()
	m.close_all_buffers_command()
end

m.close_all_buffers_command = function()
	cmd(":command Bda :%bd|e#")
end

m.toggle_auto_format = function()
	vim.api.nvim_create_user_command("TF", function()
		require("utils.functions").toggle_format_on_save()
	end, {})
end

return m
