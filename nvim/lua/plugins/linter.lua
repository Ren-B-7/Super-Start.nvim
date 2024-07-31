return {
	{
		"mfussenegger/nvim-lint",
		name = "nvim-lint",
	},
	{
		"rshkarin/mason-nvim-lint",
		name = "linter",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"VonHeikemen/lsp-zero.nvim",
		},
		setup = {
			ensure_installed = {
				"checkstyle",
				"gitlint",
				"biome",
				"luacheck",
				"pylint",
				"cpplint",
			},
			automatic_installation = true,
		},
	},
}
