return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin/nvim"
	},
	config = function()
		vim.opt.termguicolors = true
		local bufferline = require("bufferline")
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		bufferline.setup({
			highlights = require("catppuccin.special.bufferline").get_theme({
				styles = {},
				custom = {
					mocha = {
						buffer_selected = {
							fg = mocha.sky,
						},
						duplicate_selected = {
							fg = mocha.sapphire
						},
						close_button_selected = {
							fg = mocha.sky,
						}
					}
				}
			}),
			options = {
				separator_style = "thin",
				hover = {
					enabled = true,
					reveal = { 'close' },
				}
			},
		})

	end,
}
