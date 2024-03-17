-- Main plugin: https://github.com/hrsh7th/nvim-cmp
-- List of sources: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources

local setup = function()
  local luasnip = require('luasnip')
  local cmp = require('cmp')
  local m = cmp.mapping


  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local picknext = function(fallback)
    if cmp.visible() then
      cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
    elseif has_words_before then
      cmp.complete()
    else
      fallback()
    end
  end

  local pickprev = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
      -- elseif luasnip.jumpable(-1) then
      --   luasnip.jump(-1)
    else
      fallback()
    end
  end


  cmp.setup({
    snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    mapping = {
      ['<CR>'] = m(cmp.mapping.confirm({ select = false }), { "i", "c" }),
      ['<S-Space>'] = m(picknext, { "i", "c", "s" }),
      ['<C-Space>'] = m(pickprev, { "i", "c", "s" }),
      ['<C-d>'] = m(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ['<C-f>'] = m(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ['<C-e>'] = m(cmp.mapping.abort(), { "i", "c" }),
    },

    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
    }
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    sources = {
      { name = 'path' },
      { name = 'cmdline' }
    }
  })
end


return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline'
  },
  config = setup
}
