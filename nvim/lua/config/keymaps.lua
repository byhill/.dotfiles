local function nnoremap(input, output, options)
  vim.keymap.set('n', input, output, options)
end

local function vnoremap(input, output, options)
  vim.keymap.set('v', input, output, options)
end

nnoremap('<Space>', '<Nop>', { silent = true })
vnoremap('<Space>', '<Nop>', { silent = true })

nnoremap('z', 'j')

-- Remap for j and k with word wrap
nnoremap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
nnoremap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Undo Redo
nnoremap('U', '<c-R>')
nnoremap('<c-R>', 'U')

-- <leader>v commands
nnoremap('<leader>ve', ':edit $MYVIMRC<cr>', { silent = true, desc = "[v]im [e]dit, i.e., edit vimrc" })
nnoremap('<leader>vw', ':echo @%<cr>', { desc = "[v]im [w]here, i.e., print current directory" })
nnoremap('<leader>vh', ':cd %:h<cr>:pwd<cr>', { desc = "[v]im [h]ere, i.e., change currrent directory to here" })
nnoremap('<leader>vz', ':edit ~/.zshrc<cr>', { silent = true, desc = "[v]im [z]sh, i.e., edit zshrc" })
-- nnoremap('<leader>vs', ':source %:p<cr>', { silent = true }) -- Lazy doesn't support this

-- Fix indentation
nnoremap('<leader>i', "gg=G''", { desc = "[i]indentation, i.e., fix indentation" })

-- Window Remaps
-- ws, wa, wr, and wl are taken by lsp
nnoremap('<leader>wh', '<c-W>h')
nnoremap('<leader>wl', '<c-W>l')
nnoremap('<leader>wj', '<c-W>j')
nnoremap('<leader>wk', '<c-W>k')
nnoremap('<leader>wo', '<c-W>o')
nnoremap('<leader>wq', '<c-W>q')
nnoremap('<leader>ws', '<c-W>s')
nnoremap('<leader>wv', '<c-W>v')
nnoremap('<leader>wH', '<c-W>H')
nnoremap('<leader>wL', '<c-W>L')
nnoremap('<leader>wJ', '<c-W>J')
nnoremap('<leader>wK', '<c-W>K')
nnoremap('<leader>wm', ':MaximizerToggle<cr>', { silent = true })

-- Buffer Remaps
nnoremap('<leader>bd', ':bd<cr>', { desc = "[b]uffer [d]elete, i.e., delete current buffer" })
nnoremap('<leader>ba', ':%bd|e#|bd#<cr>',
  { desc = "[b]uffer delete [a]ll, i.e., delete all buffers but the current one" })

-- Diagnostic keymaps
nnoremap('[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
nnoremap(']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
nnoremap('<leader>df', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
nnoremap('<leader>dl', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
