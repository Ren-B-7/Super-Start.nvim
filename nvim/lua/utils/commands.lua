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

local typeupdatecmd = function()
	cmd(":command EasyType :lua vim.print(require('utils.easy_lsp').type_update(true)); vim.print('Type update ran')")
end

local getallcmd = function()
	cmd(":command EasyAll :lua vim.print(require('utils.easy_lsp').get_all())")
end

local getallservernamescmd = function()
	cmd(":command EasyAllNames :lua vim.print(require('utils.easy_lsp').get_all_server_names())")
end

local setpersonaltypescmd = function()
	cmd(
		":command EasyDefaultsRenier :lua require('utils.easy_lsp').__personal(); vim.print('Creators personal types set')"
	)
end

local findserverbyname = function()
	cmd(":command EasyGetServer :lua vim.print(require('utils.easy_lsp').get_server(vim.fn.input('Server > ')))")
end

local findtype = function()
	cmd(":command EasyGetType :lua vim.print(require('utils.easy_lsp').get_type(vim.fn.input('Type > ')))")
end

-- SET priority
local setpriority = function()
	cmd(
		":command EasySetPriority :lua local server = vim.fn.input('Server > ');require('utils.easy_lsp').set_priority(server, vim.fn.input('Priority > '))"
	)
end
-- ADD filetype
local addfiletype = function()
	cmd(
		":command EasyAddFiletype :lua local server = vim.fn.input('Server > ');require('utils.easy_lsp').add_filetype(server, vim.fn.input('Filetype > '))"
	)
end
-- ADD language match
local addlanguagematch = function()
	cmd(
		":command EasySetMatch :lua local lang = vim.fn.input('Language > ');require('utils.easy_lsp').match_language(lang, vim.fn.input('Match > '))"
	)
end

m.start = function()
	close_all_buffers_command()
	toggle_auto_format()
	updatecmd()
	typeupdatecmd()
	getallcmd()
	getallservernamescmd()
	setpersonaltypescmd()

	--single input
	findtype()
	findserverbyname()

	--double input
	setpriority()
	addfiletype()
	addlanguagematch()
end

return m
