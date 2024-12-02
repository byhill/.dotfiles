-- https://github.com/JuliaEditorSupport/julia-vim


local init = function()
  vim.g.latex_to_unicode_tab = "command"
end


return {
  {
    'JuliaEditorSupport/julia-vim',
    priority = 100,
    init = init,
  },
}
