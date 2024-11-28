--- https://github.com/lukas-reineke/indent-blankline.nvim

local opts = {
  indent = { char = "▏" },
  scope = {
    show_start = true,
    show_end = true,
  }
}

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = opts,
  },
}
