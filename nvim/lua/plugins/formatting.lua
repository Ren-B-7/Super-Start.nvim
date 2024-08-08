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
				c = { "clang_format" },
				Cpp = { "clang_format" },
				Java = { "clang_format" },
				Rust = { "rustfmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			formatters = {
				clang_format = {
					prepend_args = {
						"--style=file:/home/renier/.config/nvim/format-options/clang-format/.clang-format",
						"--fallback-style=webkit",
					},
				},
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
