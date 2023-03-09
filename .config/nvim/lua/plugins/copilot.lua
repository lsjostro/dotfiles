return {
  {
    "zbirenbaum/copilot.lua",
    event = { "VeryLazy" },
    dependencies = {
      "zbirenbaum/copilot-cmp",
    },
    config = function()
      require("copilot_cmp").setup()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-j>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
              ["."] = false,
        },
        copilot_node_command = "node", -- Node version must be < 18
        server_opts_overrides = {},
      })
    end,
  }
}
