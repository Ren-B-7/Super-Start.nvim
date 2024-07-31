return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	priority = 1000,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"antosha417/nvim-lsp-file-operations",
	},
	config = function()
		local function start()
			return {
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					side = "left",
					width = 40,
					--relativenumber = true,
					number = true,
					signcolumn = "no",
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false,
				},
			}
		end
		require("nvim-tree").setup(start())
	end,
}
