return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	config = true,
	lazy = true,
	cmd = {
		"NvimTreeOpen",
		"NvimTreeToggle",
		"NvimTreeResize",
		"NvimTreeRefresh",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeFocus",
		"NvimTreeHiTest",
	},
	priority = 900,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"antosha417/nvim-lsp-file-operations",
	},
	opts = {
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
