return {
	--{ "folke/lazy.nvim", version = "*", priority = 1000, enabled = true },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, dependecies = "nvim-treesitter/nvim-treesitter" },
	{ "tiagovla/scope.nvim", dependecies = { "nvim-telescope/telescope.nvim" } },
	{ "nvim-tree/nvim-web-devicons" },
	{ "lewis6991/gitsigns.nvim", lazy = true },
}
