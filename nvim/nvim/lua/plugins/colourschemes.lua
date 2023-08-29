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
      }
      -- vim.cmd.colorscheme('kanagawa')
    end,
  },
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_foreground = 'original'
      vim.g.gruvbox_material_background = 'hard'
      -- vim.cmd.colorscheme('gruvbox-material')
    end,
  },
  {
    'luisiacc/gruvbox-baby',
    priority = 1000,
    config = function()
      vim.g.gruvbox_baby_telescope_theme = 1
      -- vim.cmd.colorscheme('gruvbox-baby')
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        contrast = 'hard',
      }
      vim.cmd.colorscheme('gruvbox')
    end
  },
  {
    'rose-pine/nvim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'dawn', -- 'auto', 'main', 'moon', 'dawn'
      }
      -- vim.cmd.colorscheme('rose-pine')
    end,
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
      -- vim.cmd.colorscheme('zenbones')
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('nightfox').setup {}
      -- vim.cmd.colorscheme('nightfox')
    end
  }
}
