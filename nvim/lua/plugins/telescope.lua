--- https://github.com/nvim-telescope/telescope.nvim

local setup = function()
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')

  telescope.setup {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      },
    },
  }

  -- Enable telescope fzf native, if installed
  -- [Important] Call after setup function
  pcall(telescope.load_extension, 'fzf')

  local nmap = function(input, output, options)
    vim.keymap.set('n', input, output, options)
  end

  -- LSP telescope mappings are defined elsewhere
  nmap('<leader>s', builtin.find_files)
  nmap('<leader>rg', builtin.live_grep)
  nmap('<leader>g', builtin.grep_string)
  nmap('<leader>tm', builtin.man_pages)
  nmap('<leader>th', builtin.help_tags) -- search nvim help
  nmap('<leader>tp', builtin.builtin)   -- search all pickers
  nmap('<leader>t"', builtin.registers)
  nmap('<leader>tc', builtin.colorscheme)
  nmap('<leader>t/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end)
end


return {
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
  config = function() setup() end,
}
