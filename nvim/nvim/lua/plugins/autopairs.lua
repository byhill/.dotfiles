-- https://github.com/windwp/nvim-autopairs

local setup = function(_, opts)
  require("nvim-autopairs").setup(opts)
  require("cmp").event:on('confirm_done', require("nvim-autopairs.completion.cmp").on_confirm_done())
end

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = { 'hrsh7th/nvim-cmp' },
  opts = {},
  config = setup,
}
