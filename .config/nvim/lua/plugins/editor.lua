return {
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "telescope.nvim",
    keys = {
      {
        "<leader><leader>",
        "<cmd>Telescope git_files<cr>",
        desc = "VCS Files",
      },
      {
        "<tab>",
        function()
          require("telescope.builtin").buffers({
            sort_mru = true,
            ignore_current_buffer = true,
          })
        end,
        desc = "Telescope buffers open",
      },
      {
        "<C-p>",
        "<cmd>Telescope projects<cr>",
        desc = "Projects",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            anchor = "top",
            horizontal = {
              prompt_position = "top",
              mirror = false,
              preview_width = 0.4,
              -- preview_height = 0.5,
            },
            width = 0.9,
            height = 0.9,
            preview_cutoff = 10,
          },
          mappings = {
            i = {
              ["<esc>"] = actions.close, -- <Esc> close popup
              ["<C-u>"] = false, -- <C-u> clear prompt
              ["<C-w>"] = false, -- <C-u> clear prompt
            },
          },
          sorting_strategy = "ascending",
          winblend = 0,
          wrap_results = true,
          previewer = false,
          preview = {
            hide_on_startup = true,
          },
        },
      })
    end,
  },

  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<C-j>", neocodeium.accept)
      vim.keymap.set("i", "<A-f>", neocodeium.accept)
      vim.keymap.set("i", "<C-h>", neocodeium.cycle_or_complete)
    end,
  },
}
