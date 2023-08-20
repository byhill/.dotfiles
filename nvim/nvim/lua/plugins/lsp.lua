-- LSP settings.
local setup = function()
  -- Enable the following language servers
  local servers = {
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
    julials = {}
  }

  -- Let Mason install each server above
  require('mason').setup()
  local mason_lsp = require('mason-lspconfig')
  mason_lsp.setup {
    ensure_installed = vim.tbl_keys(servers),
  }


  --  This function gets run when an LSP connects to a particular buffer.
  local on_attach = function(client, bufnr)
    local buf = vim.lsp.buf
    local telescope = require('telescope.builtin')

    local nmap = function(keys, func, desc)
      if desc then desc = 'LSP: ' .. desc end
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local command = function(name, f, desc)
      vim.api.nvim_buf_create_user_command(bufnr, name, f, { desc = desc })
    end

    local listworkspace = function() print(vim.inspect(buf.list_workspace_folders())) end

    -- This remove semantic highlighting.  Mainly for gruvbox
    -- client.server_capabilities.semanticTokensProvider = nil

    nmap('<leader>rn', buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', buf.code_action, '[C]ode [A]ction')
    nmap('gd', buf.definition, '[G]oto [D]efinition')
    nmap('gD', buf.declaration, '[G]oto [D]eclaration')
    nmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
    nmap('gI', buf.implementation, '[G]oto [I]mplementation')
    nmap('gk', buf.hover, 'Hover Documentation')
    nmap('<leader>D', buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    nmap('<leader>wa', buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wf', listworkspace, '[W]orkspace List [F]olders')

    command('Format', function() buf.format() end, 'Format current buffer with LSP')
  end


  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


  -- Setup each LSP server
  mason_lsp.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
      }
    end,
  }




  -- Switch for controlling whether you want autoformatting.
  --  Use :FormatToggle to toggle autoformatting on or off
  local format_is_enabled = true
  vim.api.nvim_create_user_command('FormatToggle', function()
    format_is_enabled = not format_is_enabled
    print('Setting autoformatting to: ' .. tostring(format_is_enabled))
  end, {})

  -- Create an augroup that is used for managing our formatting autocmds.
  --      We need one augroup per client to make sure that multiple clients
  --      can attach to the same buffer without interfering with each other.
  local _augroups = {}
  local get_augroup = function(client)
    if not _augroups[client.id] then
      local group_name = 'kickstart-lsp-format-' .. client.name
      local id = vim.api.nvim_create_augroup(group_name, { clear = true })
      _augroups[client.id] = id
    end

    return _augroups[client.id]
  end

  -- Whenever an LSP attaches to a buffer, we will run this function.
  --
  -- See `:help LspAttach` for more information about this autocmd event.
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
    -- This is where we attach the autoformatting for reasonable clients
    callback = function(args)
      local client_id = args.data.client_id
      local client = vim.lsp.get_client_by_id(client_id)
      local bufnr = args.buf

      -- Only attach to clients that support document formatting
      if not client.server_capabilities.documentFormattingProvider then
        return
      end

      -- Tsserver usually works poorly. Sorry you work with bad languages
      -- You can remove this line if you know what you're doing :)
      if client.name == 'tsserver' then
        return
      end

      -- Create an autocmd that will run *before* we save the buffer.
      --  Run the formatting command for the LSP that has just attached.
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = get_augroup(client),
        buffer = bufnr,
        callback = function()
          if not format_is_enabled then
            return
          end

          vim.lsp.buf.format {
            async = false,
            filter = function(c)
              return c.id == client.id
            end,
          }
        end,
      })
    end,
  })
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim', tag = "legacy", event = "LspAttach", opts = {} }, -- Requires a call to setup()...
    { 'folke/neodev.nvim', opts = {} },                                      -- dito...
  },
  config = function() setup() end
}
