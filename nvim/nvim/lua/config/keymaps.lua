local function map(mode, input, output, options)
  vim.keymap.set(mode, input, output, options)
end
local function nnoremap(input, output, options)
  vim.keymap.set('n', input, output, options)
end
local function vnoremap(input, output, options)
  vim.keymap.set('v', input, output, options)
end

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for j and k with word wrap
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = "Move down", expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = "Move up", expr = true, silent = true })

-- Undo Redo
nnoremap('U', '<c-R>')
nnoremap('<c-R>', 'U')

-- <leader>v commands
nnoremap('<leader>vd', '<cmd>cd ~/.dotfiles<cr><cmd>edit .<cr>',
  { silent = true, desc = "[v]im [e]dit, i.e., edit vimrc" })
nnoremap('<leader>ve', ':edit $MYVIMRC<cr>', { silent = true, desc = "[v]im [e]dit, i.e., edit vimrc" })
nnoremap('<leader>vw', ':echo @%<cr>', { desc = "[v]im [w]here, i.e., print current directory" })
nnoremap('<leader>vh', ':cd %:h<cr>:pwd<cr>', { desc = "[v]im [h]ere, i.e., change currrent directory to here" })
nnoremap('<leader>vz', ':edit ~/.zshrc<cr>', { silent = true, desc = "[v]im [z]sh, i.e., edit zshrc" })
-- nnoremap('<leader>vs', ':source %:p<cr>', { silent = true }) -- Lazy doesn't support this

-- Fix indentation
nnoremap('<leader>i', "gg=G''", { desc = "[i]indentation, i.e., fix indentation" })


-- Buffer Remaps
nnoremap('<leader>bd', ':bd<cr>', { desc = "[b]uffer [d]elete, i.e., delete current buffer" })
nnoremap('<leader>ba', ':%bd|e#|bd#<cr>',
  { desc = "[b]uffer delete [a]ll, i.e., delete all buffers but the current one" })

-- Diagnostic keymaps
nnoremap('[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
nnoremap(']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
nnoremap('<leader>df', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
nnoremap('<leader>dl', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Window Remaps
-- ws, wa, wr, and wl are taken by lsp
nnoremap('<leader>wh', '<c-W>h', { desc = "Go to Left Window" })
nnoremap('<leader>wl', '<c-W>l', { desc = "Go to Lower Window" })
nnoremap('<leader>wj', '<c-W>j', { desc = "Go to Upper Window" })
nnoremap('<leader>wk', '<c-W>k', { desc = "Go to Right Window" })
nnoremap('<C-h>', '<C-w>h', { desc = "Go to Left Window" })
nnoremap('<C-j>', '<C-w>j', { desc = "Go to Lower Window" })
nnoremap('<C-k>', '<C-w>k', { desc = "Go to Upper Window" })
nnoremap('<C-l>', '<C-w>l', { desc = "Go to Right Window" })
nnoremap('<A-j>', '<cmd>resize +2<cr>', { desc = "Increase Window Height" })
nnoremap('<A-k>', '<cmd>resize -2<cr>', { desc = "Decrease Window Height" })
nnoremap('<A-h>', '<cmd>vertical resize -2<cr>', { expr = true, desc = "Decrease Window Width" })
nnoremap('<A-l>', '<cmd>vertical resize +2<cr>', { expr = true, desc = "Increase Window Width" })
nnoremap('<leader>wo', '<c-W>o', { desc = "Close all other windows" })
nnoremap('<leader>wq', '<c-W>q')
nnoremap('<leader>ws', '<c-W>s')
nnoremap('<leader>wv', '<c-W>v')
nnoremap('<leader>wH', '<c-W>H')
nnoremap('<leader>wL', '<c-W>L')
nnoremap('<leader>wJ', '<c-W>J')
nnoremap('<leader>wK', '<c-W>K')
nnoremap('<leader>wm', ':MaximizerToggle<cr>', { silent = true })

-- Tab management and navigation
nnoremap(']t', '<cmd>tabnext<cr>', { desc = "Next Tab" })
nnoremap('[t', '<cmd>tabprevious<cr>', { desc = "Previous Tab" })
nnoremap('[T', '<cmd>tabfirst<cr>', { desc = "First Tab" })
nnoremap(']T', '<cmd>tablast<cr>', { desc = "Last Tab" })
nnoremap('<leader>td', '<cmd>tabclose<cr>', { desc = "Delete tab" })
nnoremap('<leader>to', '<cmd>tabonly<cr>', { desc = "Delete all other tabs" })
nnoremap('<leader>t,', '<cmd>tabnext #<cr>', { desc = "Go to last accessed tab" })
nnoremap('<leader>t#', '<cmd>tabnext #<cr>', { desc = "Go to last accessed tab" })
nnoremap('<leader>tn', '<cmd>tabnew<cr>', { desc = "Open new blank tab" })
nnoremap('<leader>t.', '<cmd>tab split<cr>', { desc = "Open current window in a new tab" })
nnoremap('<leader>t;', '<cmd>wincmd T<cr>', { desc = "Open current window in a new tab and close window" })
nnoremap('<leader>t0', '<cmd>tabmove 0<cr>', { desc = "Move current tab to the first" })
nnoremap('<leader>t$', '<cmd>tabmove<cr>', { desc = "Move current tab to the last" })
nnoremap('<leader>t1', '<cmd>tabnext 1<cr>', { desc = "Go to tab 1" })
nnoremap('<leader>t2', '<cmd>tabnext 2<cr>', { desc = "Go to tab 2" })
nnoremap('<leader>t3', '<cmd>tabnext 3<cr>', { desc = "Go to tab 3" })
nnoremap('<leader>t4', '<cmd>tabnext 4<cr>', { desc = "Go to tab 4" })
nnoremap('<leader>t5', '<cmd>tabnext 5<cr>', { desc = "Go to tab 5" })
nnoremap('<leader>t6', '<cmd>tabnext 6<cr>', { desc = "Go to tab 6" })
nnoremap('<leader>t7', '<cmd>tabnext 7<cr>', { desc = "Go to tab 7" })
nnoremap('<leader>t8', '<cmd>tabnext 8<cr>', { desc = "Go to tab 8" })
nnoremap('<leader>t9', '<cmd>tabnext 9<cr>', { desc = "Go to tab 9" })

-- Command history
-- Use <C-f> in command mode to see history
-- nnoremap('q:', ':q', { desc = "Disable accidental command-history trigger when quitting" })
