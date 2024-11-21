local opts = {
	flavour = "macchiato",
	background = {
		light = "latte",
		dark = "macchiato",
	},
	term_colors = true,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.1,
	},
	styles = {
		comments = { "italic" },
		functions = { "bold" },
		conditionals = { "underline" },
	},
	default_integrations = true,
	integrations = {
		alpha = true,
		cmp = true,
		gitsigns = true,
		harpoon = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		lsp_trouble = true,
		mason = true,
		markdown = false,
		mini = { enabled = true },
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
			inlay_hints = { background = true },
		},
		nvimtree = true,
		nvim_surround = true,
		telescope = { enabled = true },
		treesitter = true,
		treesitter_context = true,
		which_key = true,
	},
}
return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catppuccin",
	config = function()
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")

		require("transparent").toggle(vim.g.transparent_enabled)
	end,
}
