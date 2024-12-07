return {
  'tpope/vim-fugitive', -- http://github.com/tpope/vim-fugitive
  'tpope/vim-rhubarb',  -- http://github.com/tpope/vim-rhubarb

  -- https://github.com/lewis6991/gitsigns.nvim
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '＋' },
        change = { text = '～' },
        delete = { text = '＿' },
        topdelete = { text = '￣' },
        changedelete = { text = '～' },
      },
    },
    cond = true,
  },
}
