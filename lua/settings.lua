local g                            = vim.g
local o                            = vim.o
local cmd                          = vim.cmd

vim.g['test#strategy']             = "neovim"
vim.g['test#neovim#term_position'] = 'vert'
g.gitblame_enabled                 = 1
g.gitblame_date_format             = '%x'
g.gitblame_message_template        = '<summary> • <author> • <date>'
g.catppuccin_flavour               = "macchiato" -- latte, frappe, macchiato, mocha

g.gitblame_enabled                 = 1
g.gitblame_date_format             = '%x'
g.gitblame_message_template        = '<summary> • <author> • <date>'

o.ch                               = 1       --command height

cmd('set shortmess+=c')                      -- Don't pass messages to |ins-completion-menu|.
cmd('set whichwrap+=<,>,[,],h,l')            -- move to next line with theses keys

cmd('set ts=2')
cmd('set sw=2')
cmd('set expandtab')

-- colorscheme

cmd("syntax enable")
cmd("syntax on")
cmd('set colorcolumn=99999') -- fix indentline for now
cmd('let g:nvcode_termcolors=256')

cmd('colorscheme ' .. O.colorscheme)
cmd('hi Normal guibg=NONE ctermbg=NONE')

-- ignore
cmd('set wildignore+=*/tmp/*,*.o,*.so,*.swp,*.zip,*/node_modules/*')
cmd('set wildignore+=*/node_modules/**')
cmd('set wildignore+=*node_modules**')

-- better whitespace
g.better_whitespace_guicolor = '#ff7b72'
g.better_whitespace_skip_empty_lines = 1


-- TMUX
g.tmux_navigator_disable_when_zoomed = 1

-- emmet
g.user_emmet_leader_key = '<C-Z>'

-- Ack (ripgrep)
cmd('cnoreabbrev Ack Ack!')
cmd([[let g:ackprg = 'rg -S --no-heading --vimgrep']])

cmd([[let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""']])
cmd([[set grepprg=ag\ --nogroup\ --nocolor]])
