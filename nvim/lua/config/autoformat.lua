local function augroup(name)
  vim.api.nvim_create_augroup(name, { clear = true })
end
local autocmd = function(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

local function command(name, action, opts)
  vim.api.nvim_create_user_command(name, action, opts)
end


--  :FormatToggle
local format_is_enabled = true
command('FormatToggle', function()
  format_is_enabled = not format_is_enabled
  print('Setting autoformatting to: ' .. tostring(format_is_enabled))
end, {})


local _augroups = {}
local get_augroup = function(client)
  if not _augroups[client.id] then _augroups[client.id] = augroup(client.name) end
  return _augroups[client.id]
end

-- Everytime an LSP attaches, we create a new autoformatting autocmd.
autocmd('LspAttach', {
  group = augroup('kickstart-lsp-attach-format'), -- Is this right???  #TODO

  callback = function(args)
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)

    if not client.server_capabilities.documentFormattingProvider then return end
    if client.name == 'tsserver' then return end

    -- Create an autocmd that will format before we save the buffer.
    autocmd('BufWritePre', {
      group = get_augroup(client),
      buffer = args.buf,
      callback = function()
        if not format_is_enabled then return end
        vim.lsp.buf.format({
          async = false,
          filter = function(c) return c.id == client.id end,
        })
      end,
    })
  end,
})
