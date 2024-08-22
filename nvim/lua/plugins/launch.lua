return {
	--{ "folke/lazy.nvim", version = "*", priority = 1000, enabled = true },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		dependecies = "nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
	},
	{ "tiagovla/scope.nvim", dependecies = { "nvim-telescope/telescope.nvim" } },
	{ "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
	{ "lewis6991/gitsigns.nvim" },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
}
