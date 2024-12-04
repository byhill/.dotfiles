-- https://github.com/mbbill/undotree/tree/master


local init = function()
  vim.g.undotree_WindowLayout       = 4
  vim.g.undotree_SplitWidth         = 40
  vim.g.undotree_DiffAutoOpen       = false
  vim.g.undotree_SetFocusWhenToggle = true
end


local setup = function()
  vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = "Toggle [u]ndotree" })
end


return {
  "mbbill/undotree",
  init = init,
  config = setup,
  cond = true,
}
