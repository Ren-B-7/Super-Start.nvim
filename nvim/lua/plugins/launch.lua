return {
	--{ "folke/lazy.nvim", version = "*", priority = 1000, enabled = true },
	{ "tiagovla/scope.nvim", dependecies = { "nvim-telescope/telescope.nvim" } },
	{ "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
	{ "lewis6991/gitsigns.nvim", event = "VeryLazy" },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
}
