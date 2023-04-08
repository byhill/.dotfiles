return {
  setup = function()
    require('nvim-treesitter.configs').setup {

      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { 'c', 'lua', 'luadoc', 'luap', 'markdown', 'markdown_inline', 'python', 'vim', 'vimdoc' },

      highlight = {
        enable = true,
      },

      indent = { enable = false, disable = { 'python' } },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-n>',
          node_incremental = '<c-n>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-m>',
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@cilass.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
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
  end
}
