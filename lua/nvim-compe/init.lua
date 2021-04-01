local o   = vim.o
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
        path = {kind = "  "},
        buffer = {kind = "  "},
        calc = {kind = "  "},
        vsnip = {kind = "  "},
        nvim_lsp = {kind = "  "},
		nvim_lua = false,
        spell = {kind = "  "},
        tags = false,
        vim_dadbod_completion = true,
        emoji = {kind = " ﲃ ", filetypes={"markdown"}}
        -- for emoji press : (idk if that in compe tho)
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
-- 
-- 
-- ﬘
-- 
-- 
-- 
-- m
-- 
-- 
-- 
-- 

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return vim.fn["compe#confirm"]()
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t("<Plug>(vsnip-expand-or-jump)")
    else
        return t("<Tab>")
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()",
    {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<CR>", [[compe#confirm("<CR>")]],
    {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-e>", [[compe#close("<C-e>")]],
    {expr = true, silent = true})
