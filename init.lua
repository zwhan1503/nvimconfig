vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

--== Vim Options
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Show Number Lines
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable swapfiles
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.laststatus = 3
vim.opt.autochdir = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 5 -- Lines to keep above/below cursor

-- Vim Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })

-- Quicker save and quit
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

-- Bind to copy to clipboard easy
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

-- Moving in Insert Mode
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- Faster Exit out of Insert Mode
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

-- Buffeer Navigation
vim.keymap.set("n", "<A-l>", "<CMD>bnext<CR>") -- Moves to next buffer
vim.keymap.set("n", "<A-h>", "<CMD>bprevious<CR>") -- Moves to previous buffer
vim.keymap.set("n", "<A-c>", "<CMD>bdelete<CR>") -- Close current buffer

-- Windows Splitting
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split windows vertiacally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make the splits equal size" })

-- Windows Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the right window" })
vim.keymap.set("n", "<C-w>", "<C-w>w", { desc = "Cycle through windows" })

--== Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
