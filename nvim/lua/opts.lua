local g = vim.g
local opt = vim.opt

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.mapleader = " "

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:1"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.textwidth = 80
opt.expandtab = true

opt.spell = true
vim.smartindent = true

-- Spelling settings
-- opt.spell = true
opt.spelllang = { "en" }

opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.modifiable = true
-- Comment this line
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- And uncomment this one in case you use Windows
-- opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir"

opt.scrolloff = 8
opt.columns = 80
opt.updatetime = 100

opt.termguicolors = true

opt.sessionoptions = { -- required
	"buffers",
	"tabpages",
	"globals",
}
