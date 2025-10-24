-- Basic require funcitons
require('config.options')
require('config.keybinds')
require('config.lazy')

-- Soft line wrapping (visual only)
vim.opt.wrap = true          -- enable wrapping
vim.opt.linebreak = true     -- wrap at word boundaries
vim.opt.breakindent = true   -- preserve indent on wrapped lines
vim.opt.showbreak = "↪ "     -- visual prefix for wrapped lines

-- Optional tweaks for better readability
vim.opt.display:append("lastline") -- show as much as possible of the last line
vim.opt.whichwrap:append("<,>,[,]") -- allow cursor to move across wrapped lines
