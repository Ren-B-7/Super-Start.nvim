return {
	{
		"mfussenegger/nvim-lint",
		name = "nvim-lint",
		lazy = false,
	},
	{
		"rshkarin/mason-nvim-lint",
		name = "linter",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"VonHeikemen/lsp-zero.nvim",
			"mfussenegger/nvim-lint",
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		setup = function()
			require("lint").linters_by_ft = require("utils.easy_lsp").get_type("Linter")

			return {
				automatic_installation = true,
			}
		end,
	},
}
