-- LSP settings.

-- Keys are the servers, values are the server configuration schema.
local server_settings = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
    },
  },
  julials = {},
  ruff = {},
  basedpyright = {},
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
    local imap = function(keys, func, desc)
      if desc then desc = 'LSP: ' .. desc end
      vim.keymap.set('i', keys, func, { buffer = bufnr, desc = desc })
    end


    local listworkspace = function() print(vim.inspect(buf.list_workspace_folders())) end

    -- This disables semantic highlighting.
    -- client.server_capabilities.semanticTokensProvider = nil

    nmap('K', vim.lsp.buf.hover, "Hover")
    nmap("gK", vim.lsp.buf.signature_help, "Signature Help")
    imap("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
    nmap('gd', buf.definition, '[g]oto local [d]efinition')
    nmap('gD', buf.declaration, '[g]oto global [D]eclaration')
    nmap('gr', buf.references, '[g]oto [r]eferences')
    nmap('gI', buf.implementation, '[g]oto [I]mplementation')
    nmap('gk', buf.hover, 'Hover Documentation')
    nmap('gy', buf.type_definition, '[g]oto t[y]pe definition')

    nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    nmap('<leader>wa', buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wf', listworkspace, '[W]orkspace List [F]olders')

    nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    nmap("<leader>cl", vim.lsp.codelens.run, "Show CodeLens")
    nmap("<leader>cC", vim.lsp.codelens.refresh, "Refresh and Display CodeLens")
    nmap("<leader>cR", Snacks.rename.rename_file, "Rename File")
    nmap('<leader>cr', buf.rename, 'Rename Symbol')
  end


  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


  -- Setup each LSP server
  local mason_lsp = require('mason-lspconfig')
  mason_lsp.setup_handlers {

    -- Default handler
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = server_settings[server_name],
      }
    end,

    ["ruff"] = function()
      require("lspconfig").ruff.setup {
        -- Don't add capabilities = capabilities
        -- We don't want ruff to provide hover or completion capabilities
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          client.server_capabilities.hoverProvider = false
        end,
        settings = server_settings["ruff"],
      }
    end
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
        opts = {},
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
