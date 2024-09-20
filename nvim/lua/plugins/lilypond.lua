return {
  'martineausimon/nvim-lilypond-suite',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()
    if vim.fn.has('macunix') then
      require('nvls').setup({
        options = {
          pitches_language = "nohl",
        },
        lilypond = {
          options = {
            pdf_viewer = nil,
          },
        },
      })
    end
  end
}
