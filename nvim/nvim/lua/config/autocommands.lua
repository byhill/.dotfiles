local augroup = function(name) vim.api.nvim_create_augroup(name, { clear = true }) end
local autocmd = function(event, opts) vim.api.nvim_create_autocmd(event, opts) end

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = '*',
})

-- Autosave when no activity occurs
local autosave = augroup('Autosave')
autocmd({ 'CursorHold', 'CursorHoldI' }, {
  command = "silent! :write",
  group = autosave,
  pattern = '*',
})
