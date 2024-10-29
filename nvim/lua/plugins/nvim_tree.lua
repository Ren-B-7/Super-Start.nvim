return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	priority = 900,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"antosha417/nvim-lsp-file-operations",
	},
	config = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			side = "left",
			width = 40,
			number = true,
			signcolumn = "no",
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
		},
	},
}
