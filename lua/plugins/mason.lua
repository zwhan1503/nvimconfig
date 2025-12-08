return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
            vim.keymap.set("n", "<C-m>", ":Mason<CR>")
        end,
    },
}
