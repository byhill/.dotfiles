-- Colourschemes
return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require("tokyonight").setup {
        style = "day",
        day_brightness = 0.4
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
          dark = "wave", -- or "dragon"
          light = "lotus"
        },
        -- vim.cmd.colorscheme('kanagawa')
      }
    end,
  },
  {
    'luisiacc/gruvbox-baby',
    priority = 1000,
    config = function()
      vim.g.gruvbox_baby_telescope_theme = 1
      vim.cmd.colorscheme('gruvbox-baby')
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        contrast = "hard",
        -- vim.cmd.colorscheme('gruvbox')
      }
    end
  },
}
