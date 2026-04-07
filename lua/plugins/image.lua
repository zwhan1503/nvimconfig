return {
	"3rd/image.nvim",
	build = "luarocks --local install magick",
	opts = {
		backend = "kitty", -- perfect since you're on kitty
		integrations = {},
		max_width_window_percentage = 50,
		max_height_window_percentage = 40,
	},
}
