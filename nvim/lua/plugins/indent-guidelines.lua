--- https://github.com/lukas-reineke/indent-blankline.nvim

local indent_blankline_opts = {
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
    ---@module "ibl"
    ---@type ibl.config
    opts = indent_blankline_opts,
    cond = true,
  },
}
