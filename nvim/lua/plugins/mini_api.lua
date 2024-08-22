return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = true,
	event = "VeryLazy",
	init = function()
		require("mini.comment").setup()
	end,
}
