return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				hover = {
					enabled = true,
					delay = 150,
					reveal = { "close" },
				},
				mode = { "buffers", "tabs" },
				themable = false,
				indicator = {
					style = "underline",
				},
				offsets = {
					{
						filetype = "NvimTree",
						text_align = "centre",
					},
				},
				seperator_style = "thick",
			},
		})
	end,
}
