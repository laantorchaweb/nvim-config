-- vim.cmd [[packadd packer.nvim]]
local fn           = vim.fn
local cmd          = vim.cmd
local execute      = vim.api.nvim_command

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

cmd('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when there are changes in plugins.lua

require('packer').init({ display = { auto_clean = false } })

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  --TEMP
  use 'slim-template/vim-slim'
  use 'sudoerwx/vim-ray-so-beautiful'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('lspsaga').setup({})
    end,
  })
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  -- use 'jose-elias-alvarez/null-ls.nvim'
  use 'mfussenegger/nvim-lint'
  use 'stevearc/conform.nvim'
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'
  use { "catppuccin/nvim", as = "catppuccin" }
  -- Lua
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- Autocomplete
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp-document-symbol"
  use "saadparwaiz1/cmp_luasnip"
  use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }

  use 'mattn/emmet-vim'
  use 'rafamadriz/friendly-snippets'
  -- use { 'styled-components/vscode-styled-components', run = 'yarn install --frozen-lockfile && yarn compile' }
  use { 'dsznajder/vscode-es7-javascript-react-snippets', run = 'yarn install --frozen-lockfile && yarn compile' }
  use 'hngocl/vs-code-full'
  use 'ijsto/emotionsnippets'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'windwp/nvim-ts-autotag'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Status Line and Bufferline
  use 'NTBBloodbath/galaxyline.nvim'
  use 'romgrk/barbar.nvim'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'
  use 'mbbill/undotree'
  use 'pbrisbin/vim-mkdir'

  -- Color
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'norcalli/nvim-colorizer.lua'

  -- Git
  use 'tpope/vim-fugitive'
  use 'f-person/git-blame.nvim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'tpope/vim-rhubarb', opt = true }
  use({
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  -- General Plugins
  use "kylechui/nvim-surround"
  use 'chaoren/vim-wordmotion'
  use 'tpope/vim-repeat'
  use 'kevinhwang91/nvim-bqf'
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'windwp/nvim-autopairs'
  use 'mileszs/ack.vim'
  use 'folke/zen-mode.nvim'
  use 'voldikss/vim-floaterm'
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  }
  use { 'ntpeters/vim-better-whitespace', opt = true }
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install', opt = true }
  use { 'junegunn/fzf', opt = true }
  use { 'junegunn/fzf.vim', opt = true }

  -- Tmux
  use 'tmux-plugins/vim-tmux'
  use 'christoomey/vim-tmux-navigator'

  --Testing
  use 'vim-test/vim-test'
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      'marilari88/neotest-vitest',
      "thenbe/neotest-playwright",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vim-test"),
          require('neotest-vitest'),
          require("neotest-playwright").adapter({
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            }
          }),
        },
      })
    end,
  }
end)
