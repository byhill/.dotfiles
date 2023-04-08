return {
  setup = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup {
      extensions = {
        fzf = {
          fuzzy = true,                 -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,  -- override the file sorter
          case_mode = "smart_case",     -- or "ignore_case" or "respect_case"
        },
      },
    }

    -- Enable telescope fzf native, if installed
    -- [Important] Call after setup function
    pcall(telescope.load_extension, 'fzf')

    local function nmap(input, output, options)
      vim.keymap.set('n', input, output, options)
    end

    -- LSP telescope mappings are defined elsewhere
    nmap('<leader>sf', builtin.find_files)
    nmap('<leader>sg', builtin.live_grep)
    nmap('<leader>sw', builtin.grep_string)
    nmap('<leader>sm', builtin.man_pages)
    nmap('<leader>sh', builtin.help_tags) -- search nvim help
    nmap('<leader>sp', builtin.builtin) -- search all pickers
    nmap('<leader>s"', builtin.registers)
    nmap('<leader>s/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end)
  end,
}
