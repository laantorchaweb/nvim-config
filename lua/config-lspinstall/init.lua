-- require'lspinstall'.setup()
-- local lsp_installer = require("nvim-lsp-installer")
-- 
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
-- 
--     -- (optional) Customize the options passed to the server
--     -- if server.name == "tsserver" then
--     --     opts.root_dir = function() ... end
--     -- end
-- 
--     -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
--     server:setup(opts)
--     vim.cmd [[ do User LspAttachBuffers ]]
-- end)
local lspconfig = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')
local null_ls = require('null-ls')
local appearance = require('config-lspinstall/appearance')
local handlers = require('config-lspinstall/handlers')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
    appearance.setup()
    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.cmd [[augroup END]]

    handlers.on_attach()
end

lsp_installer.on_server_ready(function (server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities
  }

  if server.name == 'tsserver' then
    opts.root_dir = lspconfig.util.root_pattern('tsconfig.json', '.git')
  end

  if server.name == 'eslint' then
    opts.root_dir = lspconfig.util.root_pattern('.eslintrc', '.eslintrc.json', '.git')

    opts.on_attach = function (client, bufnr)
      client.resolved_capabilities.document_formatting = true
      on_attach(client, bufnr)
    end

    opts.settings = {
      format = { enable = true }
    }
  end

  server:setup(opts)
end)

null_ls.config({
  sources = {
    null_ls.builtins.formatting.prettier
  }
})

lspconfig["null-ls"].setup({
  on_attach = on_attach
})
