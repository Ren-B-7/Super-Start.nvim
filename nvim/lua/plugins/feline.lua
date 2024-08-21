local function start(_, opts)
	local vi_feline_mode = require("feline.providers.vi_mode")

	local comp = {
		mode = {
			provider = { name = "vi_mode", opts = { show_mode_name = true, padding = "right" } },
			hl = function()
				return {
					name = vi_feline_mode.get_mode_highlight_name(),
					fg = vi_feline_mode.get_mode_color(),
					bg = "bg",
					style = "bold",
				}
			end,
		},
		file_info = {
			provider = "file_info",
			hl = {
				fg = "white",
				bg = "oceanblue",
				style = "bold",
			},
			left_sep = {
				"slant_left_2",
				{ str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
			},
			right_sep = {
				{ str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
				"slant_right_2",
				" ",
			},
		},
		file_size = {
			provider = "file_size",
			left_sep = {
				" ",
				{
					str = "vertical_bar_thin",
					hl = {
						fg = "fg",
						bg = "bg",
					},
				},
			},
			right_sep = {
				" ",
				{
					str = "slant_left_2_thin",
					hl = {
						fg = "fg",
						bg = "bg",
					},
				},
			},
		},
		pos = {
			provider = "position",
			left_sep = " ",
			right_sep = {
				" ",
				{
					str = "slant_right_2_thin",
					hl = {
						fg = "fg",
						bg = "bg",
					},
				},
			},
		},
		lsp = {
			errors = {
				provider = "diagnostic_errors",
				hl = { fg = "red" },
			},
			warnings = {
				provider = "diagnostic_warnings",
				hl = { fg = "yellow" },
			},
			hints = {
				provider = "diagnostic_hints",
				hl = { fg = "cyan" },
			},
			info = {
				provider = "diagnostic_info",
				hl = { fg = "skyblue" },
			},
		},
		git = {
			branch = {
				provider = "git_branch",
				hl = {
					fg = "white",
					bg = "black",
					style = "bold",
				},
				right_sep = {
					str = " ",
					hl = {
						fg = "NONE",
						bg = "black",
					},
				},
			},
			diff_added = {
				provider = "git_diff_added",
				hl = {
					fg = "green",
					bg = "black",
				},
			},
			diff_changed = {
				provider = "git_diff_changed",
				hl = {
					fg = "orange",
					bg = "black",
				},
			},
			diff_removed = {
				provider = "git_diff_removed",
				hl = {
					fg = "red",
					bg = "black",
				},
				right_sep = {
					str = " ",
					hl = {
						fg = "NONE",
						bg = "black",
					},
				},
			},
		},
		line_percentage = {
			provider = "line_percentage",
			hl = {
				style = "bold",
			},
			left_sep = "  ",
			right_sep = " ",
		},
		scroll_bar = {
			provider = "scroll_bar",
			hl = {
				fg = "skyblue",
				style = "bold",
			},
		},
		type = {
			provider = "file_type",
			hl = {
				fg = "white",
				bg = "oceanblue",
				style = "bold",
			},
			left_sep = {
				str = " ",
				hl = {
					fg = "NONE",
					bg = "oceanblue",
				},
			},
			right_sep = {
				{
					str = " ",
					hl = {
						fg = "NONE",
						bg = "oceanblue",
					},
				},
				"slant_right",
			},
		},
		empty = { provider = " ", hl = { fg = "skyblue", bg = "NONE" } },
	}

	local active_status = {
		{ --left
			comp.empty,
			comp.mode,
			comp.file_size,
			comp.pos,
			comp.lsp.errors,
			comp.lsp.warnings,
			comp.lsp.hints,
			comp.lsp.info,
		},
		{ --mid
			comp.file_info,
		},
		{ --right
			comp.git.branch,
			comp.git.diff_added,
			comp.git.diff_changed,
			comp.git.diff_removed,
			comp.line_percentage,
			comp.scroll_bar,
		},
	}

	local inactive_status = { { comp.empty, comp.file_info, comp.type }, { comp.line_percentage, comp.scroll_bar } }

	local shortened_status = { { comp.type }, { comp.line_percentage } }

	local conditional = {
		nvimtree_custom = {
			condition = function()
				return (vim.api.nvim_get_option_value("ft", { buf = 0 }) == "NvimTree")
			end,
			active = shortened_status,
			inactive = shortened_status,
		},
	}

	local inactive = {
		ft = {},
		bt = {},
		bn = {},
	}

	local disabled = {
		ft = { "^lazy$" },
		bt = { "^terminal$" },
		bn = {},
	}

	opts.components = { active = active_status, inactive = inactive_status }
	opts.conditional_components = { conditional.nvimtree_custom }

	opts.force_inactive = { filetypes = inactive.ft, buftypes = inactive.bt, bufnames = inactive.bn }
	opts.disable = { filetypes = disabled.ft, buftypes = disabled.bt, bufnames = disabled.bn }

	require("feline").setup(opts)
end

return {
	"freddiehaddad/feline.nvim",
	lazy = false,
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = start,
}
