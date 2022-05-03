vim.cmd [[packadd nvim-tree.lua]]

vim.o.termguicolors = true

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ":~"

vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        ignore = true,
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = ""
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}

require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    quit_on_open        = true,
    ignore_ft_on_setup  = { ".git", "node_modules", ".cache" },
    update_to_buf_dir   = {
        enable = true,
        auto_open = false,
    },
    follow              = true,
    auto_open           = false,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    diagnostics         = {
        enable = false
    },
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    view = {
        width = 25,
        height = 30,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        }
    },
    filters = {
        dotfiles = false
    }
}
