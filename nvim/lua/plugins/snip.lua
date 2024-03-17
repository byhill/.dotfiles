local function nnoremap(input, output, options)
  vim.keymap.set('n', input, output, options)
end

local function augroup(name)
  vim.api.nvim_create_augroup(name, { clear = true })
end
local autocmd = function(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end


local setup = function()
  local luasnip = require('luasnip')

  local unlinkgrp = augroup('UnlinkSnippetOnModeChange')
  autocmd('ModeChanged', {
    group = unlinkgrp,
    pattern = { 's:n', 'i:*' },
    desc = 'Forget the current snippet when leaving the insert mode',
    callback = function(evt)
      if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
        luasnip.unlink_current()
      end
    end,
  })

  vim.cmd([[
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
  ]])

  require("luasnip.loaders.from_lua").load({ paths = "./LuaSnip" })
  nnoremap('<leader>u', require('luasnip.loaders').edit_snippet_files)

  luasnip.config.setup({
    store_selection_keys = "<Tab>",
    update_events = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
  })
end

return {
  'L3MON4D3/LuaSnip',
  config = setup,
}
