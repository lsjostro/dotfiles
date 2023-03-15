return {
  {
    name = "shelman-theme",
    dir = "~/.config/shelman-theme/current/neovim",
    config = function()
      vim.cmd([[colorscheme shelman]])
    end,
  }
}
