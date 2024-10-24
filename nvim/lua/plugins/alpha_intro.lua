local create = function()
	local status_ok, alpha = pcall(require, "alpha")
	if not status_ok then
		return
	end
	local theme = require("alpha.themes.theta")
	local dashboard = require("alpha.themes.dashboard")
	local themeconfig = theme.config
	local plugs = require("lazy").stats()

	themeconfig.layout[2] = {
		type = "text",
		val = {
			"           /$$                         /$$                     /$$   /$$              ",
			"          |__/                        | $$                    |__/  | $$              ",
			"  /$$$$$$$ /$$ /$$$$$$/$$$$   /$$$$$$ | $$  /$$$$$$  /$$   /$$ /$$ /$$$$$$   /$$   /$$",
			" /$$_____/| $$| $$_  $$_  $$ /$$__  $$| $$ /$$__  $$|  $$ /$$/| $$|_  $$_/  | $$  | $$",
			"|  $$$$$$ | $$| $$ \\ $$ \\ $$| $$  \\ $$| $$| $$$$$$$$ \\  $$$$/ | $$  | $$    | $$  | $$",
			" \\____  $$| $$| $$ | $$ | $$| $$  | $$| $$| $$_____/  >$$  $$ | $$  | $$ /$$| $$  | $$",
			" /$$$$$$$/| $$| $$ | $$ | $$| $$$$$$$/| $$|  $$$$$$$ /$$/\\  $$| $$  |  $$$$/|  $$$$$$$",
			"|_______/ |__/|__/ |__/ |__/| $$____/ |__/ \\_______/|__/  \\__/|__/   \\___/   \\____  $$",
			"                            | $$                                             /$$  | $$",
			"                            | $$                                            |  $$$$$$/",
			"                            |__/                                             \\______/ ",
		},
		position = "centre",
		hl = "Type",
	}

	themeconfig.layout[6] = {
		type = "group",
		val = {
			dashboard.button("e", "  > New file", "<cmd>ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰍉  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
			dashboard.button("o", "  > Recent", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("l", "󰚥  > Plugin manager", "<cmd>Lazy<CR>"),
			dashboard.button("b", "  > Bookmarks", "<cmd>lua require('harpoon.ui').toggle_quick_menu() <CR>"),
			dashboard.button("m", "  > Mason", "<cmd>Mason<CR>"),
			dashboard.button("q", "󰈆  > Quit NVIM", "<cmd>qa<CR>"),
		},
		position = "centre",
	}

	themeconfig.layout[7] = { type = "padding", val = 2 }
	themeconfig.layout[8] = {
		type = "text",
		val = {
			"",
			"Plugins total      " .. plugs.count .. " plugins 󰗇",
			"Plugins loaded     " .. plugs.loaded .. " plugins 󰚥",
		},
		opts = { position = "centre", hl = "Type" },
	}

	themeconfig = vim.tbl_extend("force", dashboard.config, themeconfig)
	return themeconfig
end

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	lazy = false,
	priority = 1,
	config = function()
		require("alpha").setup(create())
	end,
}
