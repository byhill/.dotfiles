-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = {
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {"i", "c"}),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {"i", "c"}),
        ['<S-Space>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), {"i", "c"}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), {"i", "c"}),
        ['<Cr>'] = cmp.mapping(cmp.mapping.confirm({ select=false }), {"i", "c"}),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        ['<C-e>'] = cmp.mapping(cmp.mapping.abort(), {"i", "c"}),
    },

    sources = cmp.config.sources(
    {
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
    },
    {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
