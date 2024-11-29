local function nnoremap(input, output, options)
  vim.keymap.set('n', input, output, options)
end
local function inoremap(input, output, options)
  vim.keymap.set('i', input, output, options)
end
local function snoremap(input, output, options)
  vim.keymap.set('s', input, output, options)
end


local augroup = vim.api.nvim_create_augroup("luasnip", { clear = true })
local autocmd = function(event, opts)
  opts['group'] = augroup
  vim.api.nvim_create_autocmd(event, opts)
end

-- :help luasnip-config-options
local opts = {
  update_events = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
}


local setup = function(_, opts)
  local luasnip = require('luasnip')

  -- See https://github.com/L3MON4D3/LuaSnip/issues/656
  autocmd('ModeChanged', {
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

  inoremap("<Tab>", function()
    if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
  end, { silent = true })
  inoremap("<S-Tab>", function() luasnip.jump(-1) end, { silent = true })
  snoremap("<Tab>", function() luasnip.jump(1) end, { silent = true })
  snoremap("<S-Tab>", function() luasnip.jump(-1) end, { silent = true })

  -- :help luasnip-loaders
  require("luasnip.loaders.from_lua").load({ paths = "./LuaSnip" })
  -- :help luasnip-loaders-edit_snippets
  nnoremap('<leader>u', require('luasnip.loaders').edit_snippet_files)

  luasnip.config.setup(opts)
end


return {
  {
    'L3MON4D3/LuaSnip',
    build = "make install_jsregexp",
    opts = opts,
    config = setup,
  }
}
