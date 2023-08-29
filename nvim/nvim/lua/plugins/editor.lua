-- https://github.com/windwp/nvim-autopairs

local setup_autopairs = function()
  require('nvim-autopairs').setup {}
end

return {
  {
    'windwp/nvim-autopairs',
    config = function() setup_autopairs() end,
  },
}
