-- Treesitter is a new parser generator tool that we can
-- use in Neovim to power faster and more accurate
-- syntax highlighting.
return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    enabled = true,
    lazy = false,
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "cpp", "lua", "java", "python", "query", "rust", "javascript", "typescript", "bash" },
            auto_install = true,
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            rainbow = { enable = true },
            auto_tags = { enable = true },
        })
    end,
}
