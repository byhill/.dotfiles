local init = function()
end


local setup = function()
  vim.g.ale_use_neovim_diagnostics_api = 1
  vim.g.ale_echo_msg_format = '[%linter%] %code: %%s'
  vim.g.ale_disable_lsp = 1
  vim.g.ale_lint_on_text_changed = "normal"
  vim.g.ale_linters_explicit = 0
  vim.g.ale_virtualtext_cursor = 0
end


return {
  'dense-analysis/ale',
  init = init,
  config = setup,
  cond = false,
}
