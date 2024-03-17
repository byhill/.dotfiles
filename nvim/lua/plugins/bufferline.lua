-- https://github.com/akinsho/bufferline.nvim
-- :help bufferline

local setup = function()
  require('bufferline').setup()
end

return {
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = setup,
  }
}
