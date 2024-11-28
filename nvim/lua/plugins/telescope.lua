--- https://github.com/nvim-telescope/telescope.nvim

local setup = function()
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')

  telescope.setup {
    extensions = {

      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
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
  nmap('<leader>s', builtin.find_files, { desc = "[s]earch files" })
  nmap('<leader>rg', builtin.live_grep, { desc = "[r]ip [g]rep" })
  nmap('<leader>g', builtin.grep_string, { desc = "[g]rep string" })
  nmap('<leader>tm', builtin.man_pages, { desc = "[t]elescope [m]an pages" })
  nmap('<leader>th', builtin.help_tags, { desc = "[t]elescope vim [h]elp" })
  nmap('<leader>tp', builtin.builtin, { desc = "[t]elescope [p]ickers" })
  nmap('<leader>t"', builtin.registers, { desc = "[t]elescope [\"] registers" })
  nmap('<leader>tc', builtin.colorscheme, { desc = "[t]elescope [c]olorschemes" })
  nmap('<leader>t/', builtin.current_buffer_fuzzy_find, { desc = "[t]elescope [/] (search buffer)" })
  -- nmap('<leader>t/', function()
  --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  --     winblend = 10,
  --     previewer = false,
  --   })
  -- end)
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
  config = setup,
  cond = true,
}
