-- Basic Behavior & UI
vim.g.mapleader = " "         -- Use Space as your main shortcut key
vim.opt.number = true          -- Show line numbers
vim.opt.termguicolors = true   -- Enable high-quality colors
vim.opt.mouse = 'a'            -- Enable mouse support

-- ==========================================================================
-- SOFT LINE WRAPPING (The Note-Taker's Layout)
-- ==========================================================================
vim.opt.wrap = true           -- Enable wrapping (don't scroll horizontally)
vim.opt.linebreak = true      -- Only wrap at whole words (no breaking 'cybersec' into 'cyber' and 'sec')
vim.opt.breakindent = true    -- Keep the wrapped line aligned with the start of the paragraph
vim.opt.showbreak = "↪ "      -- Show this symbol at the start of a wrapped line
vim.opt.cpoptions:append("n") -- Ensures 'showbreak' doesn't mess up line numbers

-- THE NOTE-TAKING SECRET SAUCE:
-- This hides symbols like #, *, and [ ] so they can be replaced by icons.
-- 0 = show all, 2 = hide symbols and show rendered version.
vim.opt.conceallevel = 2 

-- Set space as leader only for normal mode
vim.g.mapleader = " "

-- Ensure your mappings specify "n" for normal mode
vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { desc = 'Find Files' })

-- Bootstrap Lazy.nvim (The Plugin Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load your plugins and the theme
require("plugins")

-- Apply the Tokyo Night theme
vim.cmd[[colorscheme tokyonight-night]]

-- Optional: Quick shortcut to toggle 'Rendered' view on/off
vim.keymap.set('n', '<leader>rn', '<cmd>RenderMarkdown toggle<cr>', { desc = 'Toggle Render' })

local builtin = require('telescope.builtin')

-- SEARCH INSIDE THE CURRENT FILE (Fuzzy find)
vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, { desc = 'Search in File' })

-- SEARCH FILENAMES (Find files in your Notes folder)
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })

-- SEARCH TEXT ACROSS ALL NOTES (Requires ripgrep)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Grep Search' })

-- RECENT FILES (Quickly go back to what you were writing)
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent Files' })

-- Netrw Appearance (The Built-in File Menu)
vim.g.netrw_banner = 0         -- Hide the help text at the top
vim.g.netrw_liststyle = 3      -- Tree-style view (expand/collapse folders)
vim.g.netrw_browse_split = 0   -- Open files in the same window
vim.g.netrw_winsize = 25       -- Set width to 25% of screen
vim.g.netrw_altv = 1           -- Open splits to the right

-- THE SHORTCUT: Leader + c + d
-- This opens Netrw in "Lexplore" (Left Explore) mode, which acts like a drawer
vim.keymap.set('n', '<leader>cd', '<cmd>Lexplore<cr>', { desc = 'Toggle File Menu' })

-- keymaps for harpoon.nvim
local harpoon = require("harpoon")

-- REQUIRED: Initialize the Harpoon list
harpoon:setup()

-- 1. ADD FILE: Mark the current file as #1, #2, #3...
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, {desc = "Harpoon Add File"})

-- 2. LIST MENU: Open the visual list of your marked files
vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon List Menu" })

-- 3. QUICK SWITCH: Jump directly to files with Space + Number
-- This is much faster than opening a file menu!
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon File 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon File 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon File 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon File 4" })

-- shortcuts for which-key.nvim
local wk = require("which-key")

-- Define labels for your shortcut groups
wk.add({
	{ "<leader>f", group = "Files/Find" }, -- Groups all your your 'f' shortcuts/keys
	{ "<leader>h", group = "Harpoon" }, -- Groups all your "h" shortucts/keys
	{ "<leader>m", group = "Markdown" }, -- Groups all your "m" shortcut/keys
	{ "<leader>c", group = "Commands" }, -- Groups all your 'cd' menus
})

-- ==========================================================================
-- TOGGLETERM LAG FIX
-- ==========================================================================

-- 1. KILL THE LAG: This forcefully deletes the mapping in Insert mode
-- We use pcall so it won't throw an error if the mapping is already gone.
pcall(vim.keymap.del, 'i', '<Space>th')

-- 2. BETTER SHORTCUT: Map toggle only to Normal Mode
-- This uses <leader>t (Space + t). 
-- It is faster and won't interfere with your typing.
vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<cr>', { desc = 'Toggle Terminal' })

-- 3. AUTO-INSERT MODE: The "Note-Taker's" workflow
-- This makes the terminal ready to type in immediately when it opens.
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    local opts = {buffer = 0}
    -- Allow ESC to exit Terminal mode so you can jump back to your notes
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    -- Start in insert mode automatically
    vim.cmd('startinsert')
  end,
})
