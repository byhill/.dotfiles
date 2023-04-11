return {
  'martineausimon/nvim-lilypond-suite',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()
    if vim.fn.has('macunix') then
      require('nvls').setup({
        -- edit config here (see "Customize default settings" in wiki)
      })
    end
  end
}
