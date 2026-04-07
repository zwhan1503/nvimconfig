return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	lazy = "leetcode.nvim" ~= vim.fn.argv()[1], -- only loads when needed
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		lang = "cpp",
		image_support = true,
		injector = {
			["cpp"] = {
				imports = function()
					-- return a different list to omit default imports
					return { "#include <bits/stdc++.h>", "using namespace std;" }
				end,
			},
		},
		keys = {
			run = "<leader>lr",
			submit = "<leader>ls",
		},
	},
}
