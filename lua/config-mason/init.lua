local mason = require('mason-lspconfig')
-- local null_ls = require('null-ls')
local lspconfig = require('lspconfig')
local appearance = require('config-lspinstall/appearance')
local handlers = require('config-lspinstall/handlers')

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  appearance.setup()
  vim.cmd [[augroup Format]]
  vim.cmd [[autocmd! * <buffer>]]
  vim.cmd [[autocmd BufWritePost <buffer> lua vim.lsp.buf.format()]]
  vim.cmd [[augroup END]]

  handlers.on_attach()
end

require("mason").setup {
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
}

mason.setup {
  ensure_installed = { "tsserver", "html" },
}

require("mason-lspconfig").setup_handlers {
  function(server_name)  -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  ['eslint'] = function()
    require("eslint").setup {
      on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true
        capabilities = capabilities
        on_attach(client, bufnr)
      end,
      root_dir = lspconfig.util.root_pattern('.eslintrc', '.eslintrc.js', '.eslintrc.json', '.git'),
      settings = {
        format = { enable = true }
      }
    }
  end
}

-- null_ls.setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   sources = {
--     null_ls.builtins.formatting.prettierd,
--     null_ls.builtins.formatting.eslint_d,
--   }
-- })
