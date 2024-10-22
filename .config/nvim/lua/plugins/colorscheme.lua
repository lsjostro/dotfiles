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
    "git@git.patagia.dev:Patagia/dieter.nvim.git",
    lazy = false,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dieter",
    },
  },
}
