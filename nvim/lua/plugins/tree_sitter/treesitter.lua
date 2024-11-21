-- Treesitter is a new parser generator tool that we can
-- use in Neovim to power faster and more accurate
-- syntax highlighting.
return {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		lazy = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = true,
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"java",
				"python",
				"query",
				"rust",
				"javascript",
				"typescript",
				"bash",
			},
			ignore_install = {},
			auto_install = true,
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			auto_tags = { enable = true },
			textobjects = { enable = true },
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = { { "nvim-treesitter/nvim-treesitter" } },
		lazy = true,
		opts = {},
		config = function()
			require("rainbow-delimiters.setup").setup({})
		end,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		enabled = true,
		lazy = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		enabled = true,
		lazy = true,
		ft = {
			"astro",
			"glimmer",
			"handlebars",
			"html",
			"javascript",
			"jsx",
			"markdown",
			"php",
			"rescript",
			"svelte",
			"tsx",
			"twig",
			"typescript",
			"vue",
			"xml",
		},

		opts = {},
	},
}
