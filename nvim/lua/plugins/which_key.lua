return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	lazy = true,
	opts = {},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
