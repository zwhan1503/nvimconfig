return {
	"chomosuke/typst-preview.nvim",
	lazy = false, -- or ft = 'typst'
	version = "1.*",
	config = function()
		require("typst-preview").setup({
			open_cmd = "qutebrowser %s",
		})

		--== Keymaps
		vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreview<CR>")
		vim.keymap.set("n", "<leader>ts", "<cmd>TypstPreviewStop<CR>")
		vim.keymap.set("n", "<leader>tt", "<cmd>TypstPreviewToggle<CR>")

        -- Compile and export to pdf in same directory
		vim.keymap.set("n", "<leader>tc", function()
			local file = vim.fn.expand("%:p")
			local cmd = "typst compile " .. vim.fn.shellescape(file)
			vim.fn.jobstart(cmd)
		end)
	end,
}
