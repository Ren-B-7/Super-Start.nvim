return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"nvim-lua/plenary.nvim",
		"VonHeikemen/lsp-zero.nvim",
		"neovim/nvim-lspconfig",
	},
	servers = {
		"clangd",
		"pylyzer",
		"dprint",
		"luacheck",
		"rust_analyzer",
		"lua_ls",
		"cpplint",
		"pylint",
		"java_language_server",
		"beautysh",
		"biome",
		"clang_format",
		"stylua",
		"black",
		"rustfmt",
	},
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
			ensure_installed = {
				"clangd",
				"pylyzer",
				"dprint",
				"lua_ls",
				"rust_analyzer",
				"java_language_server",
			},
			automatic_installation = true,
		})
		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
