-- See also, :options
local set = vim.opt

-- Tabs and indentation
-- vim-sleuth will often change these settings automatically
set.expandtab = true
set.shiftwidth = 4
set.softtabstop = -1 -- same value as shiftwidth
set.shiftround = true
set.autoindent = true

-- Colourscheme
set.termguicolors = true
set.background = 'dark' -- 'light' or 'dark'

-- Add line numbers and sign column
set.number = true
set.hlsearch = false
set.signcolumn = 'yes'
set.scrolloff = 3
set.laststatus = 2

-- Remove a couple types of annoying messages
set.shortmess:append('cs')

-- Default behaviour for opening new split
set.splitbelow = true
set.splitright = true

-- Wrapped lines will still obey indentation
set.wrap = false
set.breakindent = true

-- Sync clipboard between OS and Neovim.
set.clipboard = 'unnamedplus'

-- Enable mouse support
set.mouse = 'a'

-- Spelling
set.spell = false
set.spelllang = 'en_ca'

-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true

-- Save undo history
set.undofile = true

-- Update times
set.updatetime = 2000
set.timeout = true
set.timeoutlen = 2000

-- Make K work for manual
set.keywordprg = ':help'

-- Set completeopt to have a better completion experience
set.completeopt = 'menu,menuone,noselect,preview'

-- Save buffer when quitting, changing focus to a different buffer, etc...
-- Test
set.confirm = true
