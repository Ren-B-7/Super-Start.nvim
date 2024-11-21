return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})

			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "»",
					},
				},
				virtual_text = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		lazy = true,
		setup = {
			servers = {
				basedpyright = {
					settings = {
						basedpyright = {
							analysis = { typeCheckingMode = "standard" },
						},
					},
				},
			},
		},
	},
}
