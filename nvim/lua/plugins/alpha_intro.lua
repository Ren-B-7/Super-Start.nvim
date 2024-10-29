local statusok, alpha, theme, dashboard

local recent_align = "center"
local recent_files = {
	type = "group",
	val = {
		{
			type = "text",
			val = "Recent files",
			opts = {
				hl = "SpecialComment",
			},
		},
		{
			type = "group",
			val = function()
				local temp = theme.mru(0, vim.fn.getcwd(), 10, theme.mru_opts)
				temp.opts = {
					shrink_margin = false,
					position = recent_align,
					inherit = { shrink_margin = false, position = recent_align },
				}
				return { temp }
			end,
		},
	},
	opts = {
		shrink_margin = false,
		position = recent_align,
		inherit = { shrink_margin = false, position = recent_align },
	},
}

local create = function()
	statusok, alpha = pcall(require, "alpha")
	if not statusok then
		return
	end
	theme = require("alpha.themes.theta")
	dashboard = require("alpha.themes.dashboard")
	local themeconfig = theme.config
	local plugs = require("lazy").stats()

	themeconfig.layout[1] = { type = "padding", val = 2 }
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
		opts = { position = "center", hl = "Number" },
	}
	themeconfig.layout[3] = { type = "padding", val = 1 } --padding

	themeconfig.layout[4] = recent_files -- recent files

	themeconfig.layout[5] = { type = "padding", val = 1 } --padding

	themeconfig.layout[6] = {
		type = "group",
		val = {
			dashboard.button("e", "  > New file", "<cmd>ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰍉  > Find file", "<cmd> Telescope find_files <CR>"),
			dashboard.button("o", "  > Recent", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("l", "󰚥  > Plugin manager", "<cmd>Lazy<CR>"),
			dashboard.button("b", "  > Bookmarks", "<cmd>lua require('harpoon.ui').toggle_quick_menu() <CR>"),
			dashboard.button("m", "  > Mason", "<cmd>Mason<CR>"),
			dashboard.button("q", "󰈆  > Quit NVIM", "<cmd>qa<CR>"),
		},
		position = "center",
	}

	themeconfig.layout[7] = { type = "padding", val = 1 }

	themeconfig.layout[8] = {
		type = "text",
		val = {
			"Plugins listed     " .. plugs.count .. " plugins 󰗇",
			"Plugins loaded     " .. plugs.loaded .. " plugins 󰚥",
		},
		opts = { position = "center", hl = "Comment" },
	}

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
