return {
	"stevearc/conform.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				typescript = { "biome" },
				json = { "biome" },
				JavaScript = { "biome" },
				lua = { "stylua" },
				python = { "black" },
				bash = { "beautysh" },
				sh = { "beautysh" },
				C = { "clang-format" },
				Cpp = { "clang-format" },
				Java = { "clang-format" },
				Rust = { "rustfmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
