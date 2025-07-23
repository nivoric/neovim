return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            local toggleterm = require("toggleterm")

            -- Base Configuration
            toggleterm.setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 15
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.4
                    end
                end,
                open_mapping = [[<C-\>]],
                shade_filetypes = {},
                direction = "horizontal",
                persist_size = true,
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "rounded",
                    winblend = 10,
                    highlights = {
                        border = "DraculaBorder",
                        background = "DraculaBgDark",
                    },
                },
            })

            -- Custom Terminal Definitions
            local Terminal = require("toggleterm.terminal").Terminal

            -- Lazygit Integration
            local lazygit = Terminal:new({
                cmd = "lazygit",
                hidden = true,
                direction = "float",
                on_open = function(term)
                    vim.cmd("startinsert!")
                    vim.api.nvim_buf_set_keymap(
                        term.bufnr,
                        "n",
                        "q",
                        "<cmd>close<CR>",
                        { noremap = true, silent = true }
                    )
                end,
            })

            -- Keymaps
            vim.keymap.set("n", "<leader>gg", function()
                lazygit:toggle()
            end, { desc = "Toggle Lazygit" })

            vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>",
                { desc = "Horizontal Terminal" })
            vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical Terminal" })
            vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating Terminal" })

            -- Send lines to terminal (NvChad-style)
            vim.keymap.set("n", "<leader>tr", "<cmd>ToggleTermSendCurrentLine<CR>", { desc = "Send line to terminal" })
            vim.keymap.set("v", "<leader>tr", "<cmd>ToggleTermSendVisualSelection<CR>",
                { desc = "Send selection to terminal" })
        end,
    }
}
