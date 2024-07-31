return {
	"echasnovski/mini.nvim",
	version = false,
	init = function()
		require("mini.surround").setup()
		require("mini.comment").setup()
	end,
	event = "VeryLazy",
}
