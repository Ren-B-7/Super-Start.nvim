return {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        local format_root = vim.fs.normalize("~/.config/nvim/format-options/")
        conform.setup({
            formatters_by_ft = require("utils.easy_lsp").get_type("Formatter"),
            format_on_save = function()
                if vim.g.autoformat == 0 then
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
                    prepend_args = {
                        "--style=file:" .. format_root .. "/clang-format/.clang-format",
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
