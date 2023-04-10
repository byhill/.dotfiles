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
require('lazy').setup('plugins')


require('autocommands')
require('keymaps')
require('settings')
