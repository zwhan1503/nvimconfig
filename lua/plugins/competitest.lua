return {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    ft = { "cpp", "c", "java", "rust" }, -- only load for certain filetypes
    config = function()
        require("competitest").setup({
            compile_command = {
                cpp = { exec = "g++", args = { "-std=gnu++17", "-O2", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
                c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
                rust = { exec = "rustc", args = { "$(FNAME)" } },
                java = { exec = "javac", args = { "$(FNAME)" } },
            },
            runner_ui = {
                interface = "split",
                show_nu = true,
                viewer = {
                    width = 0.5,
                    height = 0.5,
                    show_nu = true,
                    show_rnu = false,
                    open_when_compilation_fails = true,
                },
            },
            split_ui = {
                position = "right",
                relative_to_editor = true,
                total_width = 0.3,
                vertical_layout = {
                    { 1, "tc" },
                    { 1, { { 1, "so" }, { 1, "eo" } } },
                    { 1, { { 1, "si" }, { 1, "se" } } },
                },
                total_height = 0.4,
                horizontal_layout = {
                    { 2, "tc" },
                    { 3, { { 1, "so" }, { 1, "si" } } },
                    { 3, { { 1, "eo" }, { 1, "se" } } },
                },
            },
            save_current_file = true,
            save_all_files = false,
            view_output_diff = true,
        })

        -- Keymaps for competitive programming
        vim.keymap.set("n", "<leader>cr", "<CMD>CompetiTest run<CR>")
        vim.keymap.set("n", "<leader>cc", "<CMD>CompetiTest receive problem<CR>")
        vim.keymap.set("n", "<leader>ca", "<CMD>CompetiTest add_testcase<CR>")
        vim.keymap.set("n", "<leader>cd", "<CMD>CompetiTest delete_testcase<CR>")
        vim.keymap.set("n", "<leader>ce", "<CMD>CompetiTest edit_testcase<CR>")
    end,
}
