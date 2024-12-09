-- Main plugin: https://github.com/hrsh7th/nvim-cmpcmp


local setup_cmp = function()
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
    elseif has_words_before then
      cmp.complete()
    else
      fallback()
    end
  end

  local pickprev = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
    else
      fallback()
    end
  end

  local expand_or_jump_forward = function(fallback)
    if luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    else
      fallback()
    end
  end

  local jump_back = function(fallback)
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
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

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
    }),

    matching = {
      disallow_partial_fuzzy_matching = false,
      disallow_symbol_nonprefix_matching = false,
    },

    -- Some termial emulators don't support <S-Space> and <C-Space>,
    -- and neovim doesn't reliably read these either.
    -- You can map <S-Space> to <C-n>, etc...
    -- in you terminal emulator if it supports it.
    mapping = {
      ['<CR>'] = m(m.confirm({ select = false }), { "i", "c" }),
      ['<S-Space>'] = m(picknext, { "i", "c", "s" }),
      ['<C-Space>'] = m(pickprev, { "i", "c", "s" }),
      ['<C-n>'] = m(picknext, { "i", "c", "s" }), --keep
      ['<C-p>'] = m(pickprev, { "i", "c", "s" }), --keep
      ['<C-f>'] = m(m.scroll_docs(4), { "i", "c" }),
      ['<C-b>'] = m(m.scroll_docs(-4), { "i", "c" }),
      ['<C-e>'] = m(m.abort(), { "i", "c" }),
      ['<Tab>'] = m(expand_or_jump_forward, { "i", "s" }),
      ['<S-Tab>'] = m(jump_back, { "i", "s" }),
    },

  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    },
  })

  cmp.setup.cmdline(':', {
    sources = {
      { name = 'path' },
      { name = 'cmdline' }
    },
    matching = {
      disallow_partial_fuzzy_matching = false,
      disallow_symbol_nonprefix_matching = false,
    },
  })
end


-- :help luasnip-config-options
local luasnip_options = {
  cut_selection_keys = '<Tab>',
  update_events = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
}

local setup_snippets = function(_, opts)
  local luasnip = require('luasnip')
  local augroup = vim.api.nvim_create_augroup("luasnip", { clear = true })
  local autocmd = function(event, autocmd_opts)
    autocmd_opts['group'] = augroup
    vim.api.nvim_create_autocmd(event, autocmd_opts)
  end

  -- See https://github.com/L3MON4D3/LuaSnip/issues/656
  autocmd('ModeChanged', {
    pattern = { 's:n', 'i:*' },
    desc = 'Forget the current snippet when leaving insert mode',
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

  require("luasnip.loaders.from_lua").load({ paths = "./LuaSnip" })
  vim.keymap.set('n', '<leader>p', require('luasnip.loaders').edit_snippet_files)

  luasnip.config.setup(opts)
end


local setup_autopairs = function(_, opts)
  require("nvim-autopairs").setup(opts)
  require("cmp").event:on('confirm_done', require("nvim-autopairs.completion.cmp").on_confirm_done())
end


return {

  -- https://github.com/hrsh7th/nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { -- List of sources: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = setup_cmp,
    cond = true,
  },

  -- https://github.com/L3MON4D3/LuaSnip
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    build = "make install_jsregexp",
    opts = luasnip_options,
    config = setup_snippets,
    cond = true,
  },

  -- https://github.com/windwp/nvim-autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    opts = {},
    config = setup_autopairs,
  },
}
