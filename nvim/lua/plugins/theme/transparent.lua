return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		local transparent = require("transparent").clear_prefix

		transparent("luasnip")
		transparent("bufferline")
		transparent("NvimTree")
		transparent("whichkey")
	end,
	opts = {
		groups = {
			"Normal",
			"NormalNC",
			"Comment",
			"Constant",
			"Special",
			"Identifier",
			"Statement",
			"PreProc",
			"Type",
			"Underlined",
			"Todo",
			"String",
			"Function",
			"Conditional",
			"Repeat",
			"Operator",
			"Structure",
			"LineNr",
			"NonText",
			"SignColumn",
			"CursorLine",
			"CursorLineNr",
			"StatusLine",
			"StatusLineNC",
			"EndOfBuffer",
		},
		extra_groups = {
			"NvimTreeNormal", -- NvimTree
			"WhichKey",
			"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
		},
		-- table: groups you don't want to clear
		exclude_groups = {},
		on_clear = function() end,
	},
	enabled = true,
}
