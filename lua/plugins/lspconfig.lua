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
					"tinymist",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			--== Lua
			vim.lsp.cmd = { "/usr/bin/lua-language-server" } --Mason lua_ls is old -> use system
			vim.lsp.config["lua_ls"] = {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = {
								"vim",
								"require",
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
							enable = true,
						},
					},
				},
			}
			vim.lsp.enable("lua_ls")

			--== C++
			vim.lsp.config["clangd"] = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
				end,
			}
			vim.lsp.enable("clangd")

			--== Python
			vim.lsp.config["basedpyright"] = {
				capabilities = capabilities,
			}
			vim.lsp.enable("basedpyright")

            --== Typst
			vim.lsp.config["tinymist"] = {
				capabilities = capabilities,
			}
			vim.lsp.enable("tinymist")

            -- Typst filetyep settings
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "typst",
				callback = function()
                    -- Disable broken treesitter indent (see in treesitter.lua)
					vim.opt_local.indentexpr = ""
					vim.opt_local.autoindent = true
					vim.opt_local.tabstop = 2
					vim.opt_local.shiftwidth = 2
					vim.opt_local.expandtab = true
				end,
			})

			--== Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show document" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}
