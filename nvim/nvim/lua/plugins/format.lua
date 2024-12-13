-- https://github.com/stevearc/conform.nvim
-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md


local formatters = {
  julia = { "trim_newlines", lsp_format = "last" },
  lua = { lsp_format = "first" },
  -- python = { lsp_format = "first" },
  -- markdown = { "markdownlint-cli2" },

  -- All other filetypes NOT configured above.
  ["_"] = { "trim_newlines", "trim_whitespace" },
}


--------------------------------------------------------------------------------
--- Create commands to format and enable / disable format-on-save
--------------------------------------------------------------------------------
local command = vim.api.nvim_create_user_command


local FormatEnable = function()
  print("Format-on-save is now enabled")
  vim.b.autoformat = true
  vim.g.autoformat = true
end


-- FormatDisable! will disable formatting just for the current buffer
local FormatDisable = function(args)
  if args.bang then
    print("Format-on-save is now disabled on this buffer")
    vim.b.autoformat = false
  else
    print("Format-on-save is now disabled")
    vim.g.autoformat = false
  end
end


local init = function()
  vim.g.autoformat = true
  command("Format", function() require("conform").format({ async = true }) end, { desc = "Format buffer" })
  command("FormatInfo", "<cmd>ConformInfo<cr>", { desc = "Format info" })
  command("FormatEnable", FormatEnable, { desc = "Enable format-on-save" })
  command("FormatDisable", FormatDisable, { desc = "Disable format-on-save", bang = true })
end


local format_on_save = function(bufnr)
  if vim.b[bufnr].autoformat == false or not vim.g.autoformat then
    return false
  end

  return {}
end

--------------------------------------------------------------------------------

local opts = {
  formatters_by_ft = formatters,
  format_on_save = format_on_save
}


return {
  'stevearc/conform.nvim',
  init = init,
  opts = opts,
  cond = true,
}
