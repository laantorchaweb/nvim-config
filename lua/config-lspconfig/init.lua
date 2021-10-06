local lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

local custom_attach = function()
  -- Move cursor to the next and previous diagnostic
  mapper('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
  mapper('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
end

lsp.html.setup{}
lsp.yaml.setup{}
lsp.css.setup{
  capabilities = capabilities,
}

lsp.ruby.setup{
  capabilities = capabilities,
  on_attach = custom_attach,
  init_options = {documentFormatting = false, codeAction = true},
}

lsp.efm.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {documentFormatting = false, codeAction = true},
  filetypes = {"python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown", "typescript", "typescriptreact"},
}

-- npm install -g flow
lsp.flow.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {documentFormatting = false, codeAction = true},
  filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
}

-- npm install -g typescript typescript-language-server
lsp.typescript.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {documentFormatting = false, codeAction = true},
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
}

-- npm install -g vscode-css-languageserver-bin
lsp.cssls.setup {
  capabilities = capabilities,
  cmd = {
    "node", DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
    "--stdio"
  },
  on_attach = on_attach
}

lsp.lua.setup{
  capabilities = capabilities,
  on_attach = custom_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim", "on_attach", "root_pattern"},
        disable = {"lowercase-global"}
      }
    }
  }
}

