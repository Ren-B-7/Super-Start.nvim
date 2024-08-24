local nvim_create = vim.api.nvim_create_autocmd
nvim_create("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({})
	end,
	desc = "highlights yank",
})
nvim_create("VimEnter", {
	callback = function()
		require("utils.functions").reload_nvim_tree()
	end,
	desc = "reload line numbers",
})
