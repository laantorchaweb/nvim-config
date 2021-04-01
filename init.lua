local g   = vim.g

g.auto_save = 0

require('plugins')
require("globals")
require("utils")
require("settings")
require("mappings")

require("nvim-tree")
require("nvim-compe")
require("nvim-lspkind")
require("nvim-comment")
require("nvim-floaterm")
require("nvim-gitblame")
require("nvim-gitsigns")
require("nvim-lightbulb")
require("nvim-autopairs")
require("nvim-telescope")
require("nvim-treesitter")
require("nvim-indentline")
require("nvim-galaxyline")
require("nvim-lspinstall")
require("nvim-lspconfig")
