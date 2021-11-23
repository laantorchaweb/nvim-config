local g   = vim.g
local api = vim.api
local cmd = vim.cmd
local opt = {noremap = true, silent = true}

local function imap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    api.nvim_set_keymap('i', lhs, rhs, options)
end

api.nvim_set_keymap('n', '<Space>', '<NOP>', opt)
g.mapleader = ' '

-- no hl
api.nvim_set_keymap('n', '<Leader>hh', ':set hlsearch!<CR>', opt)

-- clean search (highlight)
api.nvim_set_keymap('n', '<Leader><Space>', ':noh<CR>', {silent = true})

-- split panes
api.nvim_set_keymap('n', '<Leader>v', ':vs<CR>', opt)

-- edit init.lua
api.nvim_set_keymap('n', '<Leader>vi', ':e ~/.config/nvim/init.lua<CR>', opt)

-- Telescope
cmd([[nnoremap <Leader>e <cmd>lua require('telescope.builtin').find_files()<cr>]])
cmd([[nnoremap <Leader>a <cmd>lua require('telescope.builtin').live_grep()<cr>]])
cmd([[nnoremap <Leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>]])
cmd([[nnoremap <Leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>]])
cmd([[nnoremap <leader>fgb :lua require('telescope.builtin').git_branches()<CR>]])
cmd([[nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]])
cmd([[nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>]])

cmd([[nnoremap <Leader>ac :Ack!<Space>]])
cmd([[nnoremap <Leader>bb :GitBlameToggle<CR>]])

-- LSP bindings
api.nvim_set_keymap('n', 'sd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
api.nvim_set_keymap('n', '<Leader>sf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
api.nvim_set_keymap('n', '<Leader>si', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
api.nvim_set_keymap('n', '<Leader>ssh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
api.nvim_set_keymap('n', '<Leader>srr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
api.nvim_set_keymap('n', '<Leader>srn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)

-- Harpoon
api.nvim_set_keymap('n', '<Leader>h', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opt)
api.nvim_set_keymap('n', '<Leader>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>', opt)

-- Git
api.nvim_set_keymap('n', '<Leader>gs', ':Git<CR>', {noremap = true})
api.nvim_set_keymap('n', '<Leader>gb', ':Git blame<CR>', {noremap = true})
api.nvim_set_keymap('n', '<Leader>gd', ':Gvdiff<CR>', {noremap = true})


-- search mappings: these will make it so that going to the next one in a
-- search will center on the line it's found in
cmd('nnoremap n nzzzv')
cmd('nnoremap N Nzzzv')

-- use ; as :
cmd('nnoremap ; :')

-- explorer
api.nvim_set_keymap('n', '<Leader>ne', ':NvimTreeToggle<CR>', opt)

-- better window movement
api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

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
api.nvim_set_keymap('n', '<Leader>c', ':bd<CR>', opt)

-- Better nav for omnicomplete
cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- vim-vsnip
imap("<expr> <C-j>", "vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<C-j>'", {expr = true, noremap = true})

-- when Telescope fails
cmd('nnoremap <silent> <leader>f :FZF -m<CR>')
