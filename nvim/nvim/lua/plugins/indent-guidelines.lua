--- https://github.com/lukas-reineke/indent-blankline.nvim

local opts = {
  indent = { char = "⎜" },
  scope = {
    enabled = false,
  }
}

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = opts,
    cond = true,
  },
}
