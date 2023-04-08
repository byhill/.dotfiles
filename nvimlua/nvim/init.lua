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
  'JuliaEditorSupport/julia-vim',
  'szw/vim-maximizer',

  'lukas-reineke/indent-blankline.nvim',


  -- Tree navigation
  {
    'lambdalisue/fern.vim',
    dependencies = { 'lambdalisue/fern-hijack.vim', 'lambdalisue/fern-git-status.vim', },
    config = function()
      vim.cmd('source ~/.config/nvim/plugins/fern.vim')
    end,
  },


  -- Colourcheme
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require("gruvbox").setup {
        contrast = "hard",
      }
      vim.cmd.colorscheme('gruvbox')
    end,
  },

  -- LSP (Language Server Protocol)
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} }, -- Requires a call to setup()...
      { 'folke/neodev.nvim', opts = {} }, -- dito...
    },
    config = function() require('plugin_config/lsp').setup() end
  },

  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    config = function() require('plugin_config/snip').setup() end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline'
    },
    config = function() require('plugin_config/cmp').setup() end,
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


  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },


  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.executable 'make' == 1
      },
    },
    config = function() require('plugin_config/telescope').setup() end,
  },


  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
      require('plugin_config/treesitter').setup()
    end,
  },

  -- require 'plugins/autoformat',
  -- require 'kickstart.plugins.debug',
  --  { import = 'custom.plugins' },
}, {})


require('autocommands')
require('keymaps')
require('settings')
