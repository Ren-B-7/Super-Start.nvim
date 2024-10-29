return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("bufferline").setup({
			options = {
				hover = {
					enabled = true,
					delay = 150,
					reveal = { "close" },
				},
				mode = { "buffers", "tabs" },
				themable = true,
				indicator = {
					style = "underline",
				},
				offsets = {
					{
						filetype = "NvimTree",
						text_align = "centre",
					},
				},
				separator_style = "slant",
				numbers = function(opts)
					return string.format("%s", opts.ordinal)
				end,
			},
		})
	end,
}
