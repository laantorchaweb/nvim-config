local g   = vim.g
local api = vim.api
local cmd = vim.cmd
local opt = { noremap = true, silent = true }

local function imap(lhs, rhs, opts)
  local options = { noremap = false }
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap('i', lhs, rhs, options)
end

api.nvim_set_keymap('n', '<Space>', '<NOP>', opt)
g.mapleader = ' '

-- no hl
api.nvim_set_keymap('n', '<leader>hh', ':set hlsearch!<CR>', opt)

-- clean search (highlight)
api.nvim_set_keymap('n', '<leader><Space>', ':noh<CR>', { silent = true })

-- split panes
api.nvim_set_keymap('n', '<leader>v', ':vs<CR>', opt)

-- edit init.lua
api.nvim_set_keymap('n', '<leader>vi', ':e ~/.config/nvim/init.lua<CR>', opt)
api.nvim_set_keymap('n', '<leader><leader>x', ':w<cr>:source %<cr>', opt)

-- Telescope
cmd([[nnoremap <leader>e <cmd>lua require('telescope.builtin').find_files()<cr>]])
cmd([[nnoremap <leader>a <cmd>lua require('telescope.builtin').live_grep()<cr>]])
cmd([[nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>]])
cmd([[nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>]])
cmd([[nnoremap <leader>fgb :lua require('telescope.builtin').git_branches()<CR>]])
cmd([[nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]])
cmd([[nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>]])

cmd([[nnoremap <leader>ac :Ack!<Space>]])
cmd([[nnoremap <leader>bb :GitBlameToggle<CR>]])

-- show undotree panel
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- LSP bindings
api.nvim_set_keymap('n', 'sd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
api.nvim_set_keymap('n', 'gT', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
api.nvim_set_keymap('n', '<leader>df', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.format()<CR>', opt)
api.nvim_set_keymap('n', '<leader>si', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
api.nvim_set_keymap('n', '<leader>ssh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
api.nvim_set_keymap('n', '<leader>srr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
api.nvim_set_keymap('n', '<leader>srn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)

-- nvim-test
api.nvim_set_keymap('n', '<leader>t', ':TestNearest<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>T', ':TestFile<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>ta', ':TestSuite<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>tl', ':TestLast<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>tg', ':TestVisit<cr>', { noremap = true })

-- Git
api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>gd', ':Gvdiff<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })


-- search mappings: these will make it so that going to the next one in a
-- search will center on the line it's found in
cmd('nnoremap n nzzzv')
cmd('nnoremap N Nzzzv')

-- use ; as :
cmd('nnoremap ; :')
cmd('nnoremap ñ :')
cmd('nnoremap Ñ :')

-- explorer
api.nvim_set_keymap('n', '<leader>ne', ':NvimTreeToggle<CR>', opt)

-- better window movement
api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- better indenting
api.nvim_set_keymap('v', '<', '<gv', opt)
api.nvim_set_keymap('v', '>', '>gv', opt)

-- I hate escape
api.nvim_set_keymap('i', 'jk', '<ESC>', opt)
api.nvim_set_keymap('i', 'kj', '<ESC>', opt)
api.nvim_set_keymap('i', 'jj', '<ESC>', opt)

-- Tab switch buffer
api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', opt)
api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', opt)
api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', opt)

-- Better nav for omnicomplete
cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- zenmode
api.nvim_set_keymap('n', '<leader>z', "<cmd>lua require('zen-mode').toggle({ window = { width = .50 } })<cr>",
  { silent = true, noremap = true })

-- trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  { silent = true, noremap = true }
)

-- Todo
vim.api.nvim_set_keymap("n", "tT", "<cmd>TodoTrouble<cr>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "tt", "<cmd>TodoTelescope<cr>",
  { silent = true, noremap = true }
)
