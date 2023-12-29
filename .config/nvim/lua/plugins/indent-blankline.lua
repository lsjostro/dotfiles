return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
    opts = {
      exclude = {
        buftypes = { "terminal", "nofile" },
        filetypes = {
          "help",
          "neogitstatus",
          "NvimTree",
          "neo-tree",
          "Trouble",
        },
      },
      indent = {
        char = "│",
        tab_char = "│",
        highlight = { "Indent1", "Indent2", "Indent3", "Indent4", "Indent5", "Indent6" },
      },
    },
  }
}
