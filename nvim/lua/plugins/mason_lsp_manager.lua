return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"nvim-lua/plenary.nvim",
		"VonHeikemen/lsp-zero.nvim",
		"neovim/nvim-lspconfig",
	},
    servers = require("utils.easy_lsp").get_all_server_names(),
	config = function()
		local lsp = require("lsp-zero")
		lsp.preset("recommended")
		lsp.set_preferences({
			suggest_lsp_servers = false,
			sign_icons = {
				error = "E",
				warn = "W",
				hint = "H",
				info = "I",
			},
		})
		lsp.setup()
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
			virtual_text = true,
		})
	end,
}
