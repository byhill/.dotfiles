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

require('config.autocommands')
require('config.keymaps')
require('config.options')

-----------------------------------------------------------
--  Install plugins
-----------------------------------------------------------
require('lazyinstall')
require('lazy').setup('plugins', { change_detection = { enabled = false } })


-----------------------------------------------------------
--  Set Lilypond
-----------------------------------------------------------
vim.cmd([[
  filetype off
  set runtimepath+=/usr/local/share/lilypond/2.24.1/vim/
  filetype on
]])
