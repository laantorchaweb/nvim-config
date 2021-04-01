local lsp = require('lspconfig')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

local custom_attach = function()
  -- Move cursor to the next and previous diagnostic
  mapper('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
  mapper('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
end

lsp.html.setup{}
lsp.css.setup{}
lsp.ruby.setup{}

lsp.efm.setup{
  on_attach = on_attach,
  filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
}

-- npm install -g flow
lsp.flow.setup{
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact" },
}

-- npm install -g typescript typescript-language-server
lsp.typescript.setup{
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
}

-- npm install -g vscode-css-languageserver-bin
lsp.cssls.setup {
    cmd = {
        "node", DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
        "--stdio"
    },
    on_attach = on_attach
}
