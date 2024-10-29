local options = function()
	local highlight = {
		"RainbowRed",
		"RainbowYellow",
		"RainbowBlue",
		"RainbowOrange",
		"RainbowGreen",
		"RainbowViolet",
		"RainbowCyan",
		"SandBeige",
		"GoldenSun",
		"SunsetPink",
		"OceanTeal",
		"MountainGray",
	}

	local hooks = require("ibl.hooks")
	local create_hl = vim.api.nvim_set_hl

	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		create_hl(0, "RainbowRed", { fg = "#E06C75" })
		create_hl(0, "RainbowYellow", { fg = "#E5C07B" })
		create_hl(0, "RainbowBlue", { fg = "#61AFEF" })
		create_hl(0, "RainbowOrange", { fg = "#D19A66" })
		create_hl(0, "RainbowGreen", { fg = "#98C379" })
		create_hl(0, "RainbowViolet", { fg = "#C678DD" })
		create_hl(0, "RainbowCyan", { fg = "#56B6C2" })
		create_hl(0, "SandBeige", { fg = "#F4A460" })
		create_hl(0, "GoldenSun", { fg = "#FFD700" })
		create_hl(0, "SunsetPink", { fg = "#FCB6A4" })
		create_hl(0, "OceanTeal", { fg = "#008080" })
		create_hl(0, "MountainGray", { fg = "#A9A9A9" })
	end)
	vim.g.rainbow_delimiters = { highlight = highlight }

	hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	return {
		indent = { highlight = highlight },
		scope = {
			enabled = true,
			show_exact_scope = true,
		},
		debounce = 500,
		whitespace = { highlight = { "Whitespace", "NonText" } },
	}
end

return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = true,
	lazy = false,
	event = "BufEnter",
	init = function()
		require("ibl").setup(options())
	end,
}
