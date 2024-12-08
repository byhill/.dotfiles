--  byhill's init.lua

-----------------------------------------------------------
--  Leader keys
--
--  :help mapleader
--  :help maplocalleader
-----------------------------------------------------------
vim.g.mapleader               = ' '
vim.g.maplocalleader          = '\\'

-----------------------------------------------------------
--  Neovim Providers
--
--  :help provider
-----------------------------------------------------------
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_perl_provider    = 0

-----------------------------------------------------------
--  Load my options, keymaps, etc...
-----------------------------------------------------------
require('config')

-----------------------------------------------------------
--  Install and configure plugins
--
--  See https://lazy.folke.io/
-----------------------------------------------------------
require('lazy').setup('plugins', {
  change_detection = {
    enabled = false,
  },
  install = {
    colorscheme = { "bamboo" },
  },
  rocks = {
    enable = false,
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
})
