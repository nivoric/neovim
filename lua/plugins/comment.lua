-- ~/.config/nvim/lua/plugins/comment.lua
return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            -- Configure Comment.nvim
            require("Comment").setup({
                toggler = {
                    line = "<leader>/", -- Toggle current line
                    block = "<leader>?", -- Toggle block comment (optional)
                },
                opleader = {
                    line = "<leader>/", -- Visual mode comment
                },
                extra = {
                    above = "<leader>O", -- Add comment above (optional)
                    below = "<leader>o", -- Add comment below (optional)
                },
                mappings = {
                    basic = true, -- Enable default keymaps
                    extra = true, -- Enable extra keymaps
                },
            })

            -- Enhanced keymaps for better UX
            vim.keymap.set("n", "<leader>/", function()
                require("Comment.api").toggle.linewise.current()
            end, { desc = "Toggle comment line" })

            vim.keymap.set("x", "<leader>/",
                "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
                { desc = "Toggle comment selection" })
        end,
    }
}
