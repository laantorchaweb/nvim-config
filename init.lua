local g = vim.g

g.auto_save = 0

require("plugins")
require("globals")
require("utils")
require("config-catppuccin")
require("settings")
require("mappings")

require("config-tree")
require("config-lspkind")
require("config-mason")
require("config-lspsaga")
require("config-luasnip")
require("config-cmp")
require("config-comment")
require("config-floaterm")
require("config-gitblame")
require("config-gitsigns")
require("config-lightbulb")
require("config-telescope")
require("config-treesitter")
require("config-indentline")
require("config-galaxyline")
require("config-colorizer")
require("config-autopairs")
require("config-conform")
require("config-nvimlint")

require("zen-mode").setup({
  plugins = {
    tmux = { enabled = false }
  }
})

require("todo-comments").setup({})
require("nvim-surround").setup({})
require("trouble").setup({})

require('tabnine').setup({
  disable_auto_comment = true,
  accept_keymap = "<C-l>",
  dismiss_keymap = "<C-h>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  exclude_filetypes = { "TelescopePrompt" }
})
