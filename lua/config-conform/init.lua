local conform = require('conform')

conform.setup({
  formatters_by_ft = {
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescriptreact = { 'prettierd' },
  }
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    conform.format()
  end,
})
