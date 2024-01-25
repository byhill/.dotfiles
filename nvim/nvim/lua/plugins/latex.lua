local setup = function()
  local g = vim.g

  g.vimtex_view_method = 'skim'
  g.vimtex_quickfix_mode = 0

  local vimtex_augroup = vim.api.nvim_create_augroup("vimtex", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    pattern = "VimtexEventQuit",
    group = vimtex_augroup,
    desc = "Clean files on exit.",
    command = [[ call vimtex#compiler#clean(0) ]],
  })
end


return {
  {
    'lervag/vimtex',
    config = setup,
  },
}
