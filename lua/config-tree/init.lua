vim.cmd [[packadd nvim-tree.lua]]

vim.o.termguicolors = true

require 'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  actions             = {
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics         = {
    enable = true
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  hijack_directories  = {
    enable = true,
    auto_open = false,
  },
  system_open         = {
    cmd  = nil,
    args = {}
  },
  view                = {
    width = 35,
    side = 'left',
  },
  renderer            = {
    highlight_git        = true,
    root_folder_modifier = ":~",
    indent_markers       = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons                = {
      webdev_colors = true,
      show = {
        git = true,
        folder = true,
        file = true
      },
      glyphs = {
        default = '',
        symlink = '',
        git = {
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
    },
  },
  filters             = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = { 'node_modules', '.cache', '.git' },
  },
}
