return {
  {
    "lsjostro/alabaster.nvim",
    lazy = false,
    dependencies = {
      { "tjdevries/colorbuddy.nvim" },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "alabaster",
    },
  },
}
