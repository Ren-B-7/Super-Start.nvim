return {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    init = function()
        require("mini.comment").setup()
    end,
}
