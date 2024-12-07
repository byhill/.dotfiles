-- https://github.com/mfussenegger/nvim-lint
-- Config inspiration in part from
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/linting.lua


local linters_by_ft = {

}


-- Customize linters with a condition function, with a prepend_args table,
-- or by overriding any of the other default linter settings.
-- Can also define new (custom) linters here.
-- See https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#custom-linters
-- for default and custom linter specs.
local linters = {

}


--------------------------------------------------------------------------------
--- Toggle Diagnostics
--------------------------------------------------------------------------------
local command = vim.api.nvim_create_user_command
local augroup = vim.api.nvim_create_augroup('lint', { clear = true })
local autocmd = function(event, opts)
  opts['group'] = augroup
  vim.api.nvim_create_autocmd(event, opts)
end


local DiagnosticEnable = function()
  print("Linting is now enabled")
  vim.diagnostic.enable(true)
end

-- DiagnosticDisable! will disable diagnostics just for the current buffer
local DiagnosticDisable = function(args)
  if args.bang then
    print("Linting is now disabled on this buffer")
    vim.diagnostic.enable(false, { bufnr = 0 })
  else
    print("Linting is now disabled")
    vim.diagnostic.enable(false)
  end
end


--------------------------------------------------------------------------------
--- Linter setup
--------------------------------------------------------------------------------

local setup = function(_, opts)
  local M = {}
  local lint = require('lint')

  command("DiagnosticEnable", DiagnosticEnable, { desc = "Enable diagnostics" })
  command("DiagnosticDisable", DiagnosticDisable, { desc = "Disable diagnostics", bang = true })

  -- Override default linter settings and add custom linters to lint.linters
  for name, linter in pairs(opts.linters) do
    lint.linters[name] = lint.linters[name] or {}
    lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
    if type(linter.prepend_args) == "table" then
      lint.linters[name].args = lint.linters[name].args or {}
      vim.list_extend(lint.linters[name].args, linter.prepend_args)
    end
  end

  -- Override default linters
  -- https://github.com/mfussenegger/nvim-lint/blob/master/lua/lint.lua
  lint.linters_by_ft = opts.linters_by_ft


  function M.lint()
    if not vim.diagnostic.is_enabled({ bufnr = 0 }) then
      return
    end

    -- _resolve_linter_by_ft is a private function
    local names = lint._resolve_linter_by_ft(vim.bo.filetype)

    -- Create a copy of the names table to avoid modifying the original.
    names = vim.list_extend({}, names)

    -- Include ['_']  (fallback linters) and ['*'] (global linters)
    if #names == 0 then vim.list_extend(names, lint.linters_by_ft["_"] or {}) end
    vim.list_extend(names, lint.linters_by_ft["*"] or {})

    local filter_names = function(name)
      local linter = lint.linters[name]
      local filename = vim.api.nvim_buf_get_name(0)
      return linter and (
        type(linter) ~= "table"
        or not linter.condition
        or linter.condition(filename)
      )
    end
    names = vim.tbl_filter(filter_names, names)

    if #names > 0 then lint.try_lint(names) end
  end

  autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    callback = function()
      if vim.opt_local.modifiable:get() then M.lint() end
    end,
  })
end


--------------------------------------------------------------------------------


local opts = {
  linters_by_ft = linters_by_ft,
  linters = linters,
}


return {
  'mfussenegger/nvim-lint',
  opts = opts,
  config = setup,
  cond = true,
}
