--- https://github.com/nvim-telescope/telescope.nvim

local nmap = function(input, output, options)
  vim.keymap.set('n', input, output, options)
end
local vmap = function(input, output, options)
  vim.keymap.set('v', input, output, options)
end

local opts = {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      height = 0.98,
      width = 0.98,
      preview_width = 0.5,
    },
  },

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

local setup = function(_, opts)
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')

  telescope.setup(opts)

  -- Enable telescope fzf native, if installed
  -- [Important] Call after setup function
  pcall(telescope.load_extension, "fzf")


  -- LSP telescope mappings are defined elsewhere
  -- nmap('<leader>f', builtin.find_files({ follow = true, }), { desc = "search [f]iles" })
  nmap('<leader>f',
    function() builtin.find_files({ follow = true }) end,
    { desc = "Search [f]iles" }
  )
  nmap('<leader><space>', builtin.live_grep, { desc = "Search with rip grep" })
  nmap('<leader>sc', builtin.colorscheme, { desc = "[s]earch [c]olorschemes" })
  nmap('<leader>sf',
    function() builtin.find_files({ follow = true, hidden = true, no_ignore = true }) end,
    { silent = true, desc = "[s]earch [f]iles" }
  )
  nmap('<leader>sg', builtin.live_grep, { desc = "[s]earch with rip [g]rep" })
  nmap('<leader>sh', builtin.help_tags, { desc = "[s]earch vim [h]elp" })
  nmap('<leader>sm', builtin.man_pages, { desc = "[s]earch [m]an pages" })
  nmap('<leader>sp', builtin.builtin, { desc = "[s]earch [p]ickers" })
  nmap('<leader>ss', builtin.grep_string, { desc = "[s]earch [s]tring (grep under cursor)" })
  vmap('<leader>s', builtin.grep_string, { desc = "[s]earch string (grep under cursor)" })
  nmap('<leader>s"', builtin.registers, { desc = "[s]earch [\"] registers" })
  nmap('<leader>s.', builtin.colorscheme, { desc = "[s]earch repeat [.]" })
  nmap('<leader>s/', builtin.current_buffer_fuzzy_find, { desc = "[s]earch [/] (search buffer)" })
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
  opts = opts,
  config = setup,
  cond = true,
}
