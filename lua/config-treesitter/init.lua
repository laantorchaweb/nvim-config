local cmd = vim.cmd
local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "json",
        "yaml",
        "html",
        "css",
        "bash",
        "cpp",
        "rust",
        "lua",
        "ruby"
    },
    ignore_install = {"haskell"},
    highlight = {
        enable = true,
        use_languagetree = true
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    autotag = {enable = true},
    rainbow = {enable = true, extended_mode = true },
    context_commentstring = {enable = true, config = {javascriptreact = {style_element = '{/*%s*/}'}}}
}

cmd([[hi DiagnosticError guifg=#bf616a guibg=#2e3440]])
cmd([[hi DiagnosticWarn guifg=#e0af68 guibg=#2e3440]])
cmd([[hi DiagnosticInfo guifg=#0db9d7 guibg=#2e3440]])
cmd([[hi DiagnosticHint guifg=#4f5a75 guibg=#2e3440]])
