return {
  {
    'JuliaEditorSupport/julia-vim',
    priority = 100,
    config = function()
      vim.g.latex_to_unicode_tab = "command"
    end
  },
}
