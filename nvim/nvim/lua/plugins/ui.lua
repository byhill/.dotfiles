local setup_bufferline = function()
  require('bufferline').setup {
    options = {
      -- numbers = "buffer_id",
    }
  }
end

return {
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function() setup_bufferline() end,
  }
}
