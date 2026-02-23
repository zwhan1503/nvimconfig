return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "modern",

            -- Customize highlight groups for colors
            hi = {
                error = "DiagnosticError", -- Highlight for error diagnostics
                warn = "DiagnosticWarn", -- Highlight for warning diagnostics
                info = "DiagnosticInfo", -- Highlight for info diagnostics
                hint = "DiagnosticHint", -- Highlight for hint diagnostics
                arrow = "NonText", -- Highlight for the arrow pointing to diagnostic
                background = "CursorLine", -- Background highlight for diagnostics
                mixing_color = "Normal", -- Color to blend background with (or "None")
            },

            options = {
                show_code = true,
                severity = {
                    vim.diagnostic.severity.ERROR,
                    vim.diagnostic.severity.WARN,
                    vim.diagnostic.severity.INFO,
                    vim.diagnostic.severity.HINT,
                },

                show_related = {
                    enabled = true,
                    max_count = 3,
                },

                -- Handle messages that exceed the window width
                overflow = {
                    mode = "wrap", -- "wrap": split into lines, "none": no truncation, "oneline": keep single line
                    padding = 0, -- Extra characters to trigger wrapping earlier
                },
            },
        })

        vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics

        -- Keymaps
        vim.keymap.set("n", "<leader>de", "<cmd>TinyInlineDiag enable<cr>", { desc = "Enable diagnostics" })
        vim.keymap.set("n", "<leader>dd", "<cmd>TinyInlineDiag disable<cr>", { desc = "Disable diagnostics" })
        vim.keymap.set("n", "<leader>dt", "<cmd>TinyInlineDiag toggle<cr>", { desc = "Toggle diagnostics" })
    end,
}
