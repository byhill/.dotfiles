-- Colourschemes

return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require("tokyonight").setup {
        style = "day",
        day_brightness = 0.3
      }
      -- vim.cmd.colorscheme('tokyonight')
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        background = {
          dark = "wave", -- "dragon" or "wave"
          light = "lotus"
        },
      }
      vim.cmd.colorscheme('kanagawa')
    end,
  },
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
      -- vim.cmd.colorscheme('melange')
    end,
  },
  {
    'mcchrish/zenbones.nvim',
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      -- vim.cmd.colorscheme('zenwritten')
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
