-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- :help nvim-treesitter
-- :help nvim-treesitter-textobjects
--
-- Treesitter playground is now included in base nvim.
-- :Inspect
-- :InspectTree
-- :EditQuery

local opts = {

  ensure_installed = {
    'c',
    'javascript',
    'julia',
    'lua',
    'luadoc',
    'luap',
    'markdown',
    'markdown_inline',
    'python',
    'rust',
    'vim',
    'vimdoc'
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },

  indent = { enable = false },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-n>',
      node_incremental = '<c-n>',
      node_decremental = '<c-m>',
      scope_incremental = '<c-s>',
    },
  },

  -- There are lots of other text-objects available.
  -- See https://github.com/nvim-treesitter/nvim-treesitter-textobjects?tab=readme-ov-file#built-in-textobjects
  textobjects = {

    select = {
      enable = true,
      lookahead = false,
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@cilass.outer',
        ['ic'] = '@class.inner',
      },
    },

    move = {
      enable = false,
    },

    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },

  },
}


return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = opts,
}
