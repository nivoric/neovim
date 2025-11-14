return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                numbers = "none",
                diagnostics = "nvim_lsp",
                show_buffer_close_icons = false,
                show_close_icon = false,
                separator_style = "slant",
            },
        })

        local map = vim.keymap.set

        -- Buffer navigation
        map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
        map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

        -- Reordering
        map("n", "<leader>bn", ":BufferLineMoveNext<CR>", { silent = true })
        map("n", "<leader>bp", ":BufferLineMovePrev<CR>", { silent = true })

        -- Closing
        map("n", "<leader>bc", ":bdelete<CR>", { silent = true })

        -- Pick buffer visually
        map("n", "<leader>bb", ":BufferLinePick<CR>", { silent = true })
    end,
}
