local set = vim.keymap.set
local cmd = vim.cmd
local del = vim.keymap.del

set("n", "<leader>pv", cmd.Ex)
set("n", "<C-q>", ":w<CR> :bd<CR> :NvimTreeFocus<CR>")
set("n", "<C-c>", ":NvimTreeToggle <CR>")
set("n", "<C-s>", ":w <CR>")
-- undo tree
-- "u" - means undo
-- <c-r> - means redo
set("n", "<leader>u", cmd.UndotreeToggle)

-- telescope keymaps
local builtin = require("telescope.builtin")

set("n", "<leader>pf", builtin.find_files, {})
set("n", "<C-g>", builtin.git_files, {})
set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- harpoon keymaps
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")
set("n", "<leader>c", ui.toggle_quick_menu, {})
set("n", "<leader>a", mark.add_file, {})
set("n", "<leader>j>", ui.nav_next, {})
set("n", "<leader>k>", ui.nav_prev, {})
set("n", "<C-t>", function()
	term.gotoTerminal(1)
end)

-- lsp keymaps
local lsp = vim.lsp.buf

set("n", "gd", lsp.definition)
set("n", "K", lsp.hover)
set("n", "<leader>vws", lsp.workspace_symbol)
set("n", "<leader>vd", vim.diagnostic.open_float)
set("n", "[d", vim.diagnostic.goto_next)
set("n", "]d", vim.diagnostic.goto_prev)
set("n", "<leader>vca", lsp.code_action)
set({ "n", "v", "s", "i" }, "<leader>vrr", lsp.references)
set({ "n", "v", "s", "i" }, "<leader>vrn", lsp.rename)

-- file tree
set("n", "<leader>e", ":NvimTreeToggle<CR>", {})
set("n", "<leader>h", "<C-\\><C-N><C-w>h", {})
set("n", "gt", ":bnext<CR>")
set("n", "tg", ":bprev<CR>")
set("n", "<leader>mm", ":setlocal modifiable<CR>")
