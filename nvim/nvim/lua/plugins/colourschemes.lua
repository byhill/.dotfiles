return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1001,
    config = function()
      require('gruvbox').setup {
        contrast = 'hard',
      }
      -- vim.cmd.colorscheme('gruvbox')
    end
  },
  {
    'savq/melange-nvim',
    priority = 1001,
    config = function()
      -- vim.cmd.colorscheme('melange')
    end,
  },
  {
    'ribru17/bamboo.nvim',
    priority = 1001,
    config = function()
      vim.cmd.colorscheme('bamboo')
    end,
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1001,
    config = function()
      -- vim.cmd.colorscheme('modus')
    end
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1001,
    config = function()
      -- vim.cmd.colorscheme('dayfox')
    end,
  },
}
