local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

autopairs.setup({
    check_ts = true,          -- Enable treesitter integration
    disable_filetype = { "TelescopePrompt", "vim" },
    fast_wrap = {
        map = "<M-e>",        -- Alt + e to wrap existing text
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
})

-- If using nvim-cmp (autocompletion), integrate it with autopairs:
local cmp_status_ok, cmp = pcall(require, "cmp")
if cmp_status_ok then
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
