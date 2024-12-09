-- LSP settings.

-- Keys are the servers, values are the server configuration schema.
local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
    },
  },
  julials = {}
}


local setup = function()
  --  This function gets run when an LSP connects to a particular buffer.
  local on_attach = function(client, bufnr)
    local buf = vim.lsp.buf
    local telescope = require('telescope.builtin')
    local Snacks = require('snacks')

    local nmap = function(keys, func, desc)
      if desc then desc = 'LSP: ' .. desc end
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local command = function(name, f, desc)
      vim.api.nvim_buf_create_user_command(bufnr, name, f, { desc = desc })
    end

    local listworkspace = function() print(vim.inspect(buf.list_workspace_folders())) end

    -- This disables semantic highlighting.
    -- client.server_capabilities.semanticTokensProvider = nil

    nmap('<leader>rn', buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', buf.code_action, '[C]ode [A]ction')
    -- nmap('K', vim.lsp.buf.hover)
    nmap('gd', buf.definition, '[g]oto local [d]efinition')
    nmap('gD', buf.declaration, '[g]oto global [D]eclaration')
    nmap('gr', telescope.lsp_references, '[g]oto [r]eferences')
    nmap('gI', buf.implementation, '[g]oto [I]mplementation')
    nmap('gk', buf.hover, 'Hover Documentation')
    nmap('gy', buf.type_definition, '[g]oto t[y]pe definition')
    nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    nmap('<leader>wa', buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wf', listworkspace, '[W]orkspace List [F]olders')
    nmap("<leader>cR", Snacks.rename.rename_file, "Rename File")
  end


  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


  -- Setup each LSP server
  local mason_lsp = require('mason-lspconfig')
  mason_lsp.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
      }
    end,
  }
end

return {
  {
    'neovim/nvim-lspconfig',
    config = setup,
    dependencies = {
      'hrsh7th/nvim-cmp',
      { 'j-hui/fidget.nvim', config = true, event = "LspAttach" },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = { ensure_installed = vim.tbl_keys(servers) },
        dependencies = {
          { 'williamboman/mason.nvim', config = true },
        }
      },
      "folke/snacks.nvim",
    },
    cond = true,
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },

}
