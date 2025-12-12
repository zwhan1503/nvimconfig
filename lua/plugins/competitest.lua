return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	ft = { "cpp", "c", "java", "rust" }, -- only load for certain filetypes
	config = function()
		require("competitest").setup({
			compile_command = {
				cpp = { exec = "g++", args = { "-std=gnu++17", "-O2", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
				c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
				rust = { exec = "rustc", args = { "$(FNAME)" } },
				java = { exec = "javac", args = { "$(FNAME)" } },
			},
			popup_ui = {
				total_width = 0.8,
				total_height = 0.8,
				layout = {
					{ 2, "tc" },
					{ 3, { { 1, "so" }, { 1, "si" } } },
					{ 3, { { 1, "eo" }, { 1, "se" } } },
				},
			},
			save_current_file = true,
			save_all_files = false,
			view_output_diff = false,
		})

		-- Keymaps for competitive programming
		vim.keymap.set("n", "<leader>cr", "<CMD>CompetiTest run<CR>")
		vim.keymap.set("n", "<leader>cc", "<CMD>CompetiTest receive problem<CR>")
		vim.keymap.set("n", "<leader>ca", "<CMD>CompetiTest add_testcase<CR>")
		vim.keymap.set("n", "<leader>cd", "<CMD>CompetiTest delete_testcase<CR>")
		vim.keymap.set("n", "<leader>ce", "<CMD>CompetiTest edit_testcase<CR>")
		vim.keymap.set("n", "<leader>cs", "<CMD>CompetiTest show_ui<CR>")
	end,
}
