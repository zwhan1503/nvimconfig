return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,

	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
			},
			view_option = {
				show_hidden = false,
			},
		})

		vim.keymap.set("n", "<leader>b", "<CMD>Oil<CR>", { desc = "Open file browser" })
		vim.keymap.set("n", "<leader>cb", function()
			require("oil").open(vim.fn.expand("%:p:h"))
		end, { desc = "Open Oil in current file directory" })
	end,
}
