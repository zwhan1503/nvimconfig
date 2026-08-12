return {
	"vyfor/cord.nvim",
	opts = {
		text = {
			editing = function(opts)
				return "Editing a " .. opts.filetype .. " file"
			end,
			viewing = function(opts)
				return "Viewing a " .. opts.filetype .. " file"
			end,
			workspace = "",
		},
		display = {
			theme = "minecraft",
			flavor = "accent",
		},
	},
}
