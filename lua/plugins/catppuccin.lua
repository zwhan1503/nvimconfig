return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = true,
		integrations = { telescope = true, bufferline = true },
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		transparent_background = true
        vim.cmd.colorscheme("catppuccin")
	end,
}
