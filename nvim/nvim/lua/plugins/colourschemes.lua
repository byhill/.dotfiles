-- Colourschemes

return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        contrast = 'hard',
      }
      -- vim.cmd.colorscheme('gruvbox')
    end
  },
  {
    'savq/melange-nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('melange')
    end,
  },
  {
    'ribru17/bamboo.nvim',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme('bamboo')
    end,
  },
}
