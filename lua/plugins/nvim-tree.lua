return {
    -- Dracula Theme
    {
        "Mofiqul/dracula.nvim",
        config = function()
            vim.cmd.colorscheme "dracula"
            -- Transparency tweaks (optional)
            vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
            vim.cmd('hi Directory guibg=NONE')
        end
    },

    -- Nvim-tree (File Explorer)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                -- Dracula-friendly config
                renderer = {
                    highlight_opened_files = "name",
                    icons = {
                        glyphs = {
                            folder = {
                                arrow_closed = "▶",
                                arrow_open = "▼",
                            },
                        },
                    },
                    -- Match Dracula colors
                    highlight_git = true,
                    indent_markers = {
                        enable = true,
                    },
                },
                -- Key mappings
                view = {
                    width = 35,
                },
            })

            -- Keybindings (customize to your preference)
            vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
            vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh explorer" })
        end,
    }
}
