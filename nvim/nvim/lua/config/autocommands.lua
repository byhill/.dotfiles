local augroup = vim.api.nvim_create_augroup("default", { clear = true })

local autocmd = function(event, opts)
  opts['group'] = augroup
  vim.api.nvim_create_autocmd(event, opts)
end


-- Highlight when yanking text
autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function() (vim.hl or vim.highlight).on_yank() end,
})


autocmd('BufReadPost', {
  desc = 'Open help in a vertical split to the left',
  pattern = { 'help' },
  command = "wincmd L",
})


-- Close buffers of certain filetypes when <q> is pressed
-- From https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
autocmd("FileType", {
  desc = 'Close buffers of certain filetypes when <q> is pressed',
  pattern = {
    "checkhealth",
    "help",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})


-- -- Autosave when no activity occurs
-- autocmd({ 'CursorHold', 'CursorHoldI' }, {
--   command = "silent! :write",
-- })
