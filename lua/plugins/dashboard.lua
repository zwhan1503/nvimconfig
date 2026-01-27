return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		-- ANSI Shadow
		local header = {
			"███████╗██╗    ██╗██╗  ██╗ █████╗ ███╗   ██╗",
			"╚══███╔╝██║    ██║██║  ██║██╔══██╗████╗  ██║",
			"  ███╔╝ ██║ █╗ ██║███████║███████║██╔██╗ ██║",
			" ███╔╝  ██║███╗██║██╔══██║██╔══██║██║╚██╗██║",
			"███████╗╚███╔███╔╝██║  ██║██║  ██║██║ ╚████║",
			"╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝",
		}

		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = header,
				disable_move = true,
				shorcut_type = "number",
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{ desc = " New file", action = "enew", key = "n" },
				},
				mru = { enable = true, limit = 10, icon = " ", cwd_only = true },
				packages = { enable = false },
				project = { enable = false },
				footer = {},
				hide = {
					statusline = false,
					tabline = true,
					winbar = true,
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
