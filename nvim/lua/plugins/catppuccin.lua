return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
	opts = {
		integrations = {
			aerial = true,
			alpha = true,
			cmp = true,
			dashboard = true,
			flash = true,
			grug_far = true,
			gitsigns = true,
			headlines = false,
			illuminate = false,
			indent_blankline = { enabled = true },
			leap = false,
			lsp_trouble = true,
			mason = true,
			markdown = false,
			mini = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			navic = { enabled = true, custom_bg = "feline" },
			neotest = false,
			nvimtree = true,
			noice = false,
			notify = false,
			semantic_tokens = true,
			telescope = true,
			treesitter = true,
			treesitter_context = true,
			which_key = true,
		},
	},
}
