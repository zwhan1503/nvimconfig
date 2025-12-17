return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,

	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			columns = {
				"icon",
			},
			view_option = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			windows = {
				wrap = true,
			},
		})

		vim.keymap.set("n", "<leader>b", "<CMD>Oil<CR>", { desc = "Open file browser" })
		vim.keymap.set("n", "<leader>cb", function()
			require("oil").open(vim.fn.expand("%:p:h"))
		end, { desc = "Open Oil in current file directory" })
	end,
}
