return {
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- "lua_ls",
                    "stylua",
                    "rust_analyzer",
                    "basedpyright",
                    "clangd",
                    "jdtls",
                    "ts_ls",
                    "html",
                    "cssls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            --== Lua
            vim.lsp.cmd = {"/usr/bin/lua-language-server"} --Mason lua_ls is old -> use system
            vim.lsp.config["lua_ls"] = {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = {
                                'vim',
                                'require',
                            },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdPart = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                        hint = {
                            enable = true
                        }
                    },
                },
            }
            vim.lsp.enable("lua_ls")

            --== Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show document" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
        end
    }
}
