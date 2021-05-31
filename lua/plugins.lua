-- vim.cmd [[packadd packer.nvim]]
local fn      = vim.fn
local cmd     = vim.cmd
local execute = vim.api.nvim_command

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

cmd('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'kabouzeid/nvim-lspinstall'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
    use 'mattn/emmet-vim'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use "rafamadriz/friendly-snippets"
    use {'dsznajder/vscode-es7-javascript-react-snippets', run = 'yarn install --frozen-lockfile && yarn compile'}

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-ts-autotag'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Status Line and Bufferline
    use 'glepnir/galaxyline.nvim'
    use 'romgrk/barbar.nvim'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Color
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'sheerun/vim-polyglot'

    -- Git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -- Navigation
    use 'phaazon/hop.nvim'

    -- General Plugins
    use 'tpope/vim-surround'
    use 'chaoren/vim-wordmotion'
    use 'tpope/vim-repeat'
    use 'ntpeters/vim-better-whitespace'
    use 'kevinhwang91/nvim-bqf'
    use 'metakirby5/codi.vim'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
    use 'voldikss/vim-floaterm'
    use 'terrortylor/nvim-comment'
    use 'junegunn/goyo.vim'
    use 'windwp/nvim-autopairs'

    -- Tmux
    use 'tmux-plugins/vim-tmux'
    use 'christoomey/vim-tmux-navigator'

    -- ALE
    use 'dense-analysis/ale'
end)
