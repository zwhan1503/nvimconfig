return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- Install parsers
		require("nvim-treesitter").install({
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
		})

		-- Highlighting
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
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
				"html",
				"css",
			},
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
