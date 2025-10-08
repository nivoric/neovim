vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
-- lua/config/keybinds.lua

-- Transparency toggle state
local transparency_enabled = true

-- Functions
local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.cmd('hi Directory guibg=NONE')
    vim.cmd('hi SignColumn guibg=NONE')
end

local function disable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = nil })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
    vim.api.nvim_set_hl(0, "LineNr", { bg = nil })
    vim.cmd('hi Directory guibg=NONE')
    vim.cmd('hi SignColumn guibg=NONE')
end

local function toggle_transparency()
    transparency_enabled = not transparency_enabled
    if transparency_enabled then
        enable_transparency()
        print("Transparency enabled")
    else
        disable_transparency()
        print("Transparency disabled")
    end
end

-- Keymap
vim.keymap.set("n", "<leader>tp", toggle_transparency, { desc = "Toggle transparency" })
