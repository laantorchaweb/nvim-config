local o   = vim.o
local fn  = vim.fn
local api = vim.api

o.completeopt = "menuone,noselect"

require'compe'.setup {
    enabled = O.auto_complete,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        path = {kind = " 󰇘 "},
        buffer = {kind = "  "},
        calc = {kind = "  "},
        vsnip = {kind = " 󰃐 "},
        nvim_lsp = {kind = "  "},
        nvim_lua = true,
        -- spell = {kind = "  "},
        tags = false,
        vim_dadbod_completion = true,
        emoji = {kind = " 󰞅 ", filetypes={"markdown"}}
    }
}

-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 󰃀
-- 󰃃
-- 󱁥
-- 󰅫
-- 󰌆
-- 󰌵
-- m
-- 󰊕
-- 
-- 󰏗
-- 

local t = function(str)
    return api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = fn.col('.') - 1
    if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
