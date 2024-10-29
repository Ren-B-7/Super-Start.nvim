return {
	"stevearc/conform.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local format_root = vim.fs.find(function(name, path)
			return name:match(".*%.clang-format$")
		end, { limit = 1, type = "file", path = vim.fn.stdpath("config") })

		conform.setup({
			formatters_by_ft = require("utils.easy_lsp").get_type("Formatter"),
			format_on_save = function()
				if not vim.g.autoformat then
					return
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				}
			end,
			formatters = {
				clang_format = {
					prepend_args = function()
						local out = format_root and { "--style-file:" .. format_root } or {}
						table.insert(out, "--fallback-style=webkit")
						return out
					end,
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
