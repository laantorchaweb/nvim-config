local g   = vim.g
local api = vim.api
local cmd = vim.cmd

cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys

cmd('set ts=2')
cmd('set sw=2')
cmd('set expandtab')

-- colorscheme

cmd("syntax enable")
cmd("syntax on")
cmd('set colorcolumn=99999') -- fix indentline for now

cmd('let g:nvcode_termcolors=256')
cmd('colorscheme ' .. O.colorscheme)

-- ignore
--
cmd('set wildignore+=*/tmp/*,*.o,*.so,*.swp,*.zip,*/node_modules/*')
cmd('set wildignore+=*/node_modules/**')
cmd('set wildignore+=*node_modules**')

-- ALE

cmd('highlight clear ALEErrorSign')
cmd('highlight clear ALEWarningSign')

g.ale_sign_error = "💣"
g.ale_sign_warning = "⚠️"
g.ale_fix_on_save = 1
g.ale_linters_explicit = 0
g.ale_sign_column_always = 1
g.ale_open_list = 0
g.ale_virtualtext_cursor = 1
g.ale_virtualtext_prefix = '<| '

g.ale_fixers = {
   javascript = {'eslint', 'prettier'},
   css = {'prettier'}
}

g.ale_linters = {
   javascript = { 'flow', 'eslint' }
}

-- better whitespace

g.better_whitespace_guicolor = '#ff7b72'

-- TMUX
g.tmux_navigator_disable_when_zoomed = 1

-- emmet
g.user_emmet_leader_key='<C-Z>'
