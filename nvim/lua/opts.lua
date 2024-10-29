local g = vim.g
local opt = vim.opt
local uv = vim.uv

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.mapleader = " "
g.autoformat = true

---@Autosetup for python provider
-- local py_file = vim.fs.find(function(name, path)
-- 	return name:match("py_location.py$")
-- end, { limit = 1, type = "file", path = vim.fn.stdpath("config") })[1] or nil
--
-- if py_file then
-- 	local stdout, handle = uv.new_pipe()
-- 	handle = uv.spawn("python", { args = { py_file }, stdio = { nil, stdout, nil } }, function(status)
-- 		uv.read_stop(stdout)
-- 		uv.close(stdout)
-- 		uv.close(handle)
-- 	end)
-- 	stdout:read_start(function(status, data)
-- 		if data then
-- 			g.python3_host_prog = data
-- 			g.loaded_python3_provider = 1
-- 		end
-- 	end)
-- end

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:1"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.textwidth = 80
opt.expandtab = true

opt.listchars = { eol = "¬", tab = ">>", trail = "·", space = "␣" }

vim.smartindent = true

-- Spelling settings
opt.spell = true
opt.spelllang = { "en" }

opt.wrap = false

opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "split"

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.modifiable = true
-- Comment this line
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Set nvim clipboard and system clipboard
opt.clipboard = "unnamedplus"

opt.scrolloff = 5
opt.columns = vim.api.nvim_win_get_width(0)
opt.updatetime = 100

opt.termguicolors = true

opt.sessionoptions = { -- required
	"buffers",
	"tabpages",
	"globals",
	"resize",
}
g.node_host_prog = "~/.nvm/versions/node/v20.10.0/lib/node_modules"
