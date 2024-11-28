local which_key_opts = {
  preset = "modern",
  delay = function(ctx)
    return ctx.plugin and 0 or 1000
  end,
}


return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = which_key_opts,
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
  },
  cond = true,
}
