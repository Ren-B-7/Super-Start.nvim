local nvim_create = vim.api.nvim_create_autocmd
nvim_create("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({})
	end,
	desc = "highlights yank",
})
nvim_create("VimEnter", {
	callback = function()
		require("nvim-tree.api").tree.open()
		require("nvim-tree.api").tree.focus()
	end,
	desc = "reload line numbers",
})
