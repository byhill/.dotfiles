--  byhill's init.lua

-----------------------------------------------------------
--  Leader keys
-----------------------------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-----------------------------------------------------------
--  Neovim Providers
-----------------------------------------------------------
vim.g.python3_host_prog = '~/.pyenv/versions/nvim/bin/python'
vim.g.node_host_prog = '/usr/local/bin/neovim-node-host'
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-----------------------------------------------------------
--  Install the plugin manager lazy.nvim if not already installed
-----------------------------------------------------------
require('lazyinstall')

-----------------------------------------------------------
--  Install plugins
-----------------------------------------------------------
require('lazy').setup({

  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'tpope/vim-unimpaired',
  'szw/vim-maximizer',

  'lambdalisue/fern.vim',
  'lambdalisue/fern-hijack.vim',
  'lambdalisue/fern-git-status.vim',

  'lukas-reineke/indent-blankline.nvim',

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} }, -- Requires a call to setup()...
      { 'folke/neodev.nvim', opts = {} }, -- dito...
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline' },
  },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Colourcheme
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function() vim.cmd.colorscheme 'gruvbox' end,
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },


  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },


  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',
  --  { import = 'custom.plugins' },
}, {})


require('autocommands')
require('keymaps')
require('settings')

require('plugins/telescope')
require('plugins/treesitter')
require('plugins/cmp')
require('plugins/lsp')

vim.cmd('source ~/.config/nvim/plugins/fern.vim')
