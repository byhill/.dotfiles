local setup = function()
  local luasnip = require('luasnip')

  local unlinkgrp = vim.api.nvim_create_augroup(
    'UnlinkSnippetOnModeChange',
    { clear = true }
  )

  vim.api.nvim_create_autocmd('ModeChanged', {
    group = unlinkgrp,
    pattern = { 's:n', 'i:*' },
    desc = 'Forget the current snippet when leaving the insert mode',
    callback = function(evt)
      if
          luasnip.session
          and luasnip.session.current_nodes[evt.buf]
          and not luasnip.session.jump_active
      then
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

  vim.keymap.set('n', '<leader>u', require('luasnip.loaders').edit_snippet_files)

  luasnip.config.setup({
    store_selection_keys = "<Tab>",
    update_events = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
  })
end

return {
  'L3MON4D3/LuaSnip',
  config = function() setup() end,
}
