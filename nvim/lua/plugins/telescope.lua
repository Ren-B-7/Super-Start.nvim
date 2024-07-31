return {
	"nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    cmd = "Telescope",
    config = function()
        local actions = require "telescope.actions"
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,
            
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,

                    ["<C-q>"] = actions.close,
                    },
                    n = {
                    ["<esc>"] = actions.close,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["q"] = actions.close,
                    },
                },
            },
            pickers = { buffers = { show_all_buffers = true}}
        })
    end
}
