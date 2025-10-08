-- lua/plugins/colors.lua

-- List of theme plugins
return {
    -- Tokyonight
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        lazy = false,
    },

    -- Night Owl
    {
        "oxfist/night-owl.nvim",
        name = "night-owl",
        lazy = false,
    },

    -- Tundra
    {
        "sam4llis/nvim-tundra",
        name = "tundra",
        lazy = false,
        config = function()
            require("nvim-tundra").setup({
                transparent_background = true,
                editor = { search = {}, substitute = {} },
                syntax = {
                    booleans = { bold = true, italic = true },
                    comments = { italic = true },
                },
            })
        end,
    },

    -- Moonfly
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
    },

    -- VSCode Dark+
    {
        "Mofiqul/vscode.nvim",
        name = "vscode",
        lazy = false,
        config = function()
            vim.g.vscode_style = "dark"
        end,
    },

    -- One Dark
    {
        "navarasu/onedark.nvim",
        name = "onedark",
        lazy = false,
        config = function()
            require("onedark").setup({
                style = "dark",
                transparent = true,
            })
        end,
    },
}
