local augroup = vim.api.nvim_create_augroup("default", { clear = true })
local autocmd = function(event, opts)
  opts['group'] = augroup
  vim.api.nvim_create_autocmd(event, opts)
end

-- Highlight on yank
autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  pattern = '*',
})

-- Autosave when no activity occurs
autocmd({ 'CursorHold', 'CursorHoldI' }, {
  command = "silent! :write",
  pattern = '*',
})
