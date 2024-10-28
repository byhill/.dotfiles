--- https://github.com/lukas-reineke/indent-blankline.nvim

local setup = function()
  require("ibl").setup({
    indent = { char = "▏" },
  })
end


return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = setup,
  },
}
