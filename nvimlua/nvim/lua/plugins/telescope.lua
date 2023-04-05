local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
  },
}

-- Enable telescope fzf native, if installed
-- [Important] Call after setup function
pcall(telescope.load_extension, 'fzf')



local function nnoremap(input, output, options)
  vim.keymap.set('n', input, output, options)
end

-- LSP telescope mappings are defined elsewhere
nnoremap('<leader>sf', builtin.find_files)
nnoremap('<leader>sg', builtin.live_grep)
nnoremap('<leader>sw', builtin.grep_string)
nnoremap('<leader>sm', builtin.man_pages)
nnoremap('<leader>sh', builtin.help_tags)  -- search nvim help
nnoremap('<leader>sp', builtin.builtin)  -- search all pickers
nnoremap('<leader>s"', builtin.registers)
nnoremap('<leader>s/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)
