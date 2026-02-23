return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		lsp_styles = {
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
		transparent_background = true,
		integrations = {
			telescope = true,
			bufferline = true,
            dashboard = true,
            mason = true,
            treesitter_context = true,
			nui = true, -- pop ups configure
		},
		custom_highlights = function(colors)
			return {
				-- NUI (which competitest uses for popups)
				NormalFloat = { bg = "none" },
				FloatBorder = { fg = colors.blue, bg = "none" },
				FloatTitle = { fg = colors.lavender, bg = "none", style = { "bold" } },

				-- Ensure all popup-related highlights are transparent
				Pmenu = { bg = "none" },
				PmenuBorder = { fg = colors.blue, bg = "none" },

				-- Override any potential background highlights
				["@markup.raw"] = { bg = "none" },
				["@text.literal"] = { bg = "none" },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		transparent_background = true
		vim.cmd.colorscheme("catppuccin")
	end,
}
