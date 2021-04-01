local g   = vim.g

g.auto_save = 0

require('plugins')
require("globals")
require("utils")
require("settings")
require("mappings")

require("config-tree")
require("config-compe")
require("config-lspkind")
require("config-comment")
require("config-floaterm")
require("config-gitblame")
require("config-gitsigns")
require("config-lightbulb")
require("config-telescope")
require("config-treesitter")
require("config-indentline")
require("config-galaxyline")
require("config-lspinstall")
require("config-lspconfig")
require("config-colorizer")
require("config-autopairs")
