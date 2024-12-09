return {

  -- https://github.com/akinsho/bufferline.nvim
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

  -- https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {
      indent = { char = "▏" },
      scope = {
        enabled = false,
      }
    },
  },

}
