local setup = function()
  vim.g.ale_use_neovim_diagnostics_api = 1
  vim.g.ale_virtualtext_cursor = 0
  vim.g.ale_fix_on_save = 1
  vim.g.ale_echo_msg_format = '[%linter%] %code: %%s'

  local tbl = {}
  tbl['*'] = { "remove_trailing_lines", "trim_whitespace" }

  vim.g.ale_fixers = tbl
end

return {
  --   'dense-analysis/ale',
  --   config = setup
}
