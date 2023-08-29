local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local function nnoremap(input, output, options)
  vim.keymap.set('n', input, output, options)
end

nnoremap('<leader>ll', ':Lazy<cr>', { silent = true })
nnoremap('<leader>lu', ':Lazy update<cr>')
