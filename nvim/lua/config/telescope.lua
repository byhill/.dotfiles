-- https://github.com/nvim-telescope/telescope.nvim

local telescope = require('telescope')
local builtin = require('telescope.builtin')
telescope.load_extension('fzf')

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

vim.keymap.set('n', '<leader>s',  builtin.find_files, {})
vim.keymap.set('n', '<leader>rg', builtin.live_grep,  {})
vim.keymap.set('n', '<leader>tm', builtin.man_pages,  {})
vim.keymap.set('n', '<leader>th', builtin.help_tags,  {})  -- search nvim help
vim.keymap.set('n', '<leader>tp', builtin.builtin,    {})  -- search all pickers
vim.keymap.set('n', '<leader>t"', builtin.registers,  {})
