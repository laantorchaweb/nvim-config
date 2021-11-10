-- local lsp = require('lspconfig')
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
-- 
--   -- Enable completion triggered by <c-x><c-o>
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 
--   -- Mappings.
--   local opts = { noremap=true, silent=true }
-- 
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
-- 
--   -- LSP bindings
--   buf_set_keymap('n', 'sd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', '<Leader>sf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
--   buf_set_keymap('n', '<Leader>si', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<Leader>ssh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   buf_set_keymap('n', '<Leader>srr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   buf_set_keymap('n', '<Leader>srn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   buf_set_keymap('n', '<Leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- 
-- end
-- 
-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = {
--   'html',
--   'cssls',
--   'yamlls',
--   'tsserver',
--   'stylelint_lsp',
--   'solargraph',
--   'jsonls',
--   'eslint',
--   'elixirls',
--   'emmet_ls',
--   'diagnosticls'
-- }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end


-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     'documentation',
--     'detail',
--     'additionalTextEdits',
--   }
-- }

-- local mapper = function(mode, key, result)
--   vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
-- end

-- local custom_attach = function()
--   -- Move cursor to the next and previous diagnostic
--   mapper('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
--   mapper('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
-- end

-- lsp.html.setup{}
-- lsp.yamlls.setup{}
-- lsp.css.setup{
--   capabilities = capabilities,
-- }
-- 
-- lsp.ruby.setup{
--   capabilities = capabilities,
--   on_attach = custom_attach,
--   init_options = {documentFormatting = false, codeAction = true},
-- }
-- 
-- lsp.efm.setup{
--   capabilities = capabilities,
--   on_attach = on_attach,
--   init_options = {documentFormatting = false, codeAction = true},
--   filetypes = {"python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown", "typescript", "typescriptreact"},
-- }
-- 
-- -- npm install -g flow
-- lsp.flow.setup{
--   capabilities = capabilities,
--   on_attach = on_attach,
--   init_options = {documentFormatting = false, codeAction = true},
--   filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
-- }
-- 
-- -- npm install -g typescript typescript-language-server
-- lsp.typescript.setup{
--   capabilities = capabilities,
--   on_attach = on_attach,
--   init_options = {documentFormatting = false, codeAction = true},
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
-- }
-- 
-- -- npm install -g vscode-css-languageserver-bin
-- lsp.cssls.setup {
--   capabilities = capabilities,
--   cmd = {
--     "node", DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
--     "--stdio"
--   },
--   on_attach = on_attach
-- }
-- 
-- lsp.lua.setup{
--   capabilities = capabilities,
--   on_attach = custom_attach,
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = {"vim", "on_attach", "root_pattern"},
--         disable = {"lowercase-global"}
--       }
--     }
--   }
-- }
-- 
