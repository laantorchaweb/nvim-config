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
lsp.efm.setup{
  filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
}

lsp.flow.setup{
  filetypes = { "javascript", "javascriptreact" },
}

lsp.typescript.setup{
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
}
