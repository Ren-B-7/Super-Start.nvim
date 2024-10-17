return {
    --{ "folke/lazy.nvim", version = "*", priority = 1000, enabled = true },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '-' },
                topdelete = { text = '↑' },
                changedelete = { text = '·' },
            },
            signs_staged = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '-' },
                topdelete = { text = '↑' },
                changedelete = { text = '·' },
            }
        },
    },
    {
        "tiagovla/scope.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        lazy = false,
        event = "VeryLazy",
        priority = 849,
    },
    { "nvim-tree/nvim-web-devicons", event = "VeryLazy",    lazy = false },
    { "windwp/nvim-autopairs",       event = "InsertEnter", lazy = true,  config = true },
    { "nvim-lua/plenary.nvim",       event = "VeryLazy",    lazy = false, priority = 850 },
}
