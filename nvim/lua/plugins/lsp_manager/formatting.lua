return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local format_root = vim.fs.find(function(name, path)
			return name:match(".*%.clang-format$")
		end, { limit = 1, type = "file", path = vim.fn.stdpath("config") })

		conform.setup({
			formatters_by_ft = {
				bash = { "beautysh" },
				sh = { "beautysh" },
				ksh = { "beautysh" },
				csh = { "beautysh" },
				zsh = { "beautysh" },
				latex = { "bibtex-tidy" },
				tex = { "bibtex-tidy" },
				python = { "black" },
				py = { "black" },
				c = { "clang-format" },
				csharp = { "clang-format" },
				cpp = { "clang-format" },
				json = { "clang-format", "prettierd" },
				java = { "clang-format" },
				javascript = { "clang-format", "prettierd" },
				make = { "cmake-format" },
				angular = { "prettierd" },
				css = { "prettierd" },
				flow = { "prettierd" },
				graphql = { "prettierd" },
				html = { "prettierd" },
				jsx = { "prettierd" },
				less = { "prettierd" },
				markdown = { "prettierd" },
				scss = { "prettierd" },
				typescript = { "prettierd" },
				vue = { "prettierd" },
				yaml = { "prettierd" },
				ruby = { "rubocop" },
				lua = { "stylua" },
				luau = { "stylua" },
			},
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
						return table.insert(
							format_root and { "--style-file:" .. format_root } or {},
							"--fallback-style=webkit"
						)
					end,
				},
			},
		})
	end,
	keys = {
		{
			"<leader>mf",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or range (in visual mode)",
		},
	},
}
