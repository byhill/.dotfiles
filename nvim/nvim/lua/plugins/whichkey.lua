-- https://github.com/folke/which-key.nvim


local opts = {
  preset = "modern",
  delay = function(ctx) return ctx.plugin and 0 or 1000 end,
  disable = {
    ft = { "neo-tree" }, -- See https://github.com/folke/which-key.nvim/issues/899
  },
}


local setup = function(_, opts)
  require("which-key").add({
    { "<leader>b", group = "buffers" },
    { "<leader>t", group = "Tab management" },
    { "<leader>v", group = "vim" },
    { "[",         group = "prev" },
    { "]",         group = "next" },
  })

  require("which-key").setup(opts)
end


return {
  "folke/which-key.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
  },
  event = "VeryLazy",
  opts = opts,
  config = setup,
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = true }) end,
      desc = "Global Keymaps (which-key)",
    },
  },
}
