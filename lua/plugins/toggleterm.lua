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

			local function close_term()
				vim.api.nvim_input("<C-\\><C-n>")
				vim.cmd("ToggleTerm")
			end

			local Terminal = require("toggleterm.terminal").Terminal

			-- Compile and Run C++ file
			vim.keymap.set("n", "<F5>", function()
				if vim.bo.filetype == "cpp" then
					local current_file = vim.fn.expand("%:p") -- Gets the full path
					local basename = vim.fn.expand("%:t:r") -- Gets "main"
					local file_dir = vim.fn.expand("%:p:h") -- Gets directory
					local output_path = file_dir .. "/" .. basename -- Full path to output

					local cmd = string.format(
						"g++ -std=c++17 -O2 -Wall '%s' -o '%s' && '%s'",
						current_file,
						output_path,
						output_path
					)

					local cpp_terminal = Terminal:new({
						cmd = cmd,
						dir = file_dir, -- Set working directory to file's directory
						direction = "vertical",
						size = 70,
						close_on_exit = false,
					})
					cpp_terminal:toggle()
				end
			end, { desc = "CP:  Compile and Run" })

			--== Toggle Terminal Keymaps
			vim.keymap.set("n", "<leader>t", "<CMD>ToggleTerm<CR>")
			vim.keymap.set("t", "<Esc><Esc>", close_term) -- Escape and Close Terminal
		end,
	},
}
