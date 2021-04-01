local g   = vim.g
local fn  = vim.fn
local api = vim.api

require('nvim-autopairs').setup()
local npairs = require('nvim-autopairs')

local function imap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('i', lhs, rhs, options)
end

_G.MUtils = {}

g.completion_confirm_key = ""

MUtils.completion_confirm = function()
    if fn.pumvisible() ~= 0 then
        if fn.complete_info()["selected"] ~= -1 then
            fn["compe#confirm"]()
            return npairs.esc("")
        else
            api.nvim_select_popupmenu_item(0, false, false, {})
            fn["compe#confirm"]()
            return npairs.esc("<c-n>")
        end
    else
        return npairs.check_break_line_char()
    end
end

MUtils.tab = function()
    if fn.pumvisible() ~= 0 then
        return npairs.esc("<C-n>")
    else
        if fn["vsnip#available"](1) ~= 0 then
            fn.feedkeys(string.format('%c%c%c(vsnip-expand-or-jump)', 0x80, 253, 83))
            return npairs.esc("")
        else
            return npairs.esc("<Tab>")
        end
    end
end

MUtils.s_tab = function()
    if fn.pumvisible() ~= 0 then
        return npairs.esc("<C-p>")
    else
        if fn["vsnip#jumpable"](-1) ~= 0 then
            fn.feedkeys(string.format('%c%c%c(vsnip-jump-prev)', 0x80, 253, 83))
            return npairs.esc("")
        else
            return npairs.esc("<C-h>")
        end
    end
end

-- Autocompletion and snippets
api.nvim_set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})

imap("<Tab>", "v:lua.MUtils.tab()", {expr = true, noremap = true})
imap("<S-Tab>", "v:lua.MUtils.s_tab()", {expr = true, noremap = true})
