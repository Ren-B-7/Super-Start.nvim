local set = vim.keymap.set
local del = vim.keymap.del

-- lsp
local lsp = vim.lsp.buf
local diagn = vim.diagnostic

-- imports
local functions = require("utils.functions")
local builtin = require("telescope.builtin")
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
local extensions = require("telescope").extensions

set("n", "<C-q>", ":w!<CR> :bd!<CR> :NvimTreeFocus<CR>", { desc = "Save, close buffer, and focus on NvimTree" })
set("n", "<C-s>", ":w <CR>", { desc = "Save the current selected file" })

-- telescope keysets
set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
set(
	"n",
	"<leader>fa",
	"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
	{ desc = "Find files in all directories" }
)
set("n", "<leader>fg", builtin.live_grep, { desc = "Search within files" })
set("n", "<leader>fb", builtin.buffers, { desc = "List open buffers" })
set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
set("n", "<leader>fo", builtin.oldfiles, { desc = "Open recently used files" })
set("n", "<leader>fc", builtin.git_commits, { desc = "Show git commits" })
set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "View undo history" })
set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Search for a string in the current file" })

-- harpoon keymaps
set("n", "<leader>z", ui.toggle_quick_menu, { desc = "Toggle Harpoon quick menu" })
set("n", "<leader>a", mark.add_file, { desc = "Add file to Harpoon" })
set("n", "<leader>j", ui.nav_next, { desc = "Navigate to next Harpoon file" })
set("n", "<leader>k", ui.nav_prev, { desc = "Navigate to previous Harpoon file" })

-- lsp keymaps
set("n", "gd", lsp.definition, { desc = "Go to definition" })
set("n", "K", lsp.hover, { desc = "Show LSP hover information" })
set("n", "<leader>vs", lsp.workspace_symbol, { desc = "Search workspace symbols" })
set("n", "<leader>vd", diagn.open_float, { desc = "Open diagnostics float" })
set("n", "[d", diagn.goto_next, { desc = "Go to next diagnostic" })
set("n", "]d", diagn.goto_prev, { desc = "Go to previous diagnostic" })
set("n", "<leader>ca", lsp.code_action, { desc = "Show code actions" })
set({ "n", "v" }, "<leader>gr", lsp.references, { desc = "Find references" })
set({ "n", "v" }, "<leader>rn", lsp.rename, { desc = "Rename symbol" })

-- file tree
set("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle tree view" })
set("n", "<leader>h", "<C-\\><C-N><C-w>h", { desc = "Focus on NvimTree" })

-- navigation
set("n", "gt", ":bnext<CR>", { desc = "Go to next buffer" })
set("n", "tg", ":bprev<CR>", { desc = "Go to previous buffer" })

set("n", "<leader>tm", functions.toggle_modifiable, { desc = "Toggle modifiable option" })
set("n", "<leader>tl", functions.toggle_list_and_col, { desc = "Toggle whitespace and line length display" })
set("n", "<leader>tf", functions.toggle_format_on_save, { desc = "Toggle format on save" })
set({ "n", "x", "v", "i" }, "<leader>tv", "<cmd>TransparentToggle<CR>", { desc = "Toggle transparent window" })

set({ "n", "x", "v" }, "<leader>rr", extensions.refactoring.refactors, { desc = "Show refactoring options" })

-- Moving and resizing windows
set("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
set("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height" })
set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- terminal resize
set("t", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Decrease terminal height" })
set("t", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Increase terminal height" })
set("t", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease terminal width" })
set("t", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase terminal width" })

-- Switching windows
set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- terminal window movements
set("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left terminal" })
set("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to bottom terminal" })
set("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to top terminal" })
set("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right terminal" })

-- terminal create commands
set(
	{ "n", "t", "v" },
	"<leader>tr",
	"<cmd>ToggleTerm direction=vertical<CR>",
	{ desc = "Create new vertical terminal" }
)
set(
	{ "n", "t", "v" },
	"<leader>td",
	"<cmd>ToggleTerm direction=horizontal<CR>",
	{ desc = "Create new horizontal terminal" }
)
set({ "n", "t", "v" }, "<leader>th", "<cmd>ToggleTerm direction=float<CR>", { desc = "Create new hover terminal" })
set({ "n", "t", "v" }, "<leader>tn", function()
	require("harpoon.term").gotoTerminal(2)
end, { desc = "Create new terminal buffer" })

-- moving blocks of text
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- easy indenting
set("v", "<", "<gv", { desc = "Indent left" })
set("v", ">", ">gv", { desc = "Indent right" })

-- easy buffer change
set("n", "<TAB>", "<cmd>bn<CR>", { desc = "Move to next buffer" })
set("n", "<S-TAB>", "<cmd>bp<CR>", { desc = "Move to previous buffer" })
set("n", "<leader>bd", "<cmd>bd!<CR>", { desc = "Close current buffer" })

-- Bind to exit neovim terminal
set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

set("n", "<leader>nf", "<cmd> NvimTreeFindFile <CR>", { desc = "Navigate to current file with tree" })
