return {
  {
    "lsjostro/alabaster.nvim",
    -- dir = "~/src/github.com/blmiranda/alabaster.nvim/",
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
