return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({
			compile_command = {
				cpp = { exec = "g++", args = { "-std=gnu++17", "-O2", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
			},
			popup_ui = {
				total_width = 0.8,
				total_height = 0.8,
				layout = {
					{ 2, "tc" },
					{
						3,
						{
							{ 1, "so" },
							{ 1, "si" },
						},
					},
					{
						3,
						{
							{ 1, "eo" },
							{ 1, "se" },
						},
					},
				},
			},
		})
	end,
}
