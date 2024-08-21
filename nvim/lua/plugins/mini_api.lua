return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = true,
	init = function()
		require("mini.comment").setup()
	end,
}
