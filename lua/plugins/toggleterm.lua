return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 70,
			open_mapping = false,
			direction = "vertical",
			close_on_exit = true,
			persist_size = true,
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)

			function close_term()
				vim.api.nvim_input("<C-\\><C-n>")
				vim.cmd("ToggleTerm")
			end

			--== Toggle Terminal
			vim.keymap.set("n", "<leader>t", "<CMD>ToggleTerm<CR>")
			vim.keymap.set("t", "<Esc><Esc>", close_term) -- Escape and Close Terminal
		end,
	},
}
