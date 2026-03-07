return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"java",
				"javascript",
				"typescript",
				"tsx",
				"python",
				"c",
				"cpp",
				"markdown",
				"vim",
				"vimdoc",
				"html",
				"css",
				"typst",
			},
			highlight = { enable = true },
			indent = {
				enable = true,
				disable = { "typst" }, -- indent is broken see on https://github.com/nvim-treesitter/nvim-treesitter/issues/7815
			},
		})
	end,
}
