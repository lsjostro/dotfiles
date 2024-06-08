return {
  -- {
  --   "lsjostro/alabaster.nvim",
  --   -- dir = "~/src/github.com/blmiranda/alabaster.nvim/",
  --   lazy = false,
  --   dependencies = {
  --     { "tjdevries/colorbuddy.nvim" },
  --   },
  -- },
  {
    "shelmangroup/dieter.nvim",
    lazy = false,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dieter",
    },
  },
}
