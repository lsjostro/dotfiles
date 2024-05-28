return {
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    dependencies = {
      "kkharji/sqlite.lua",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
    config = function()
      local util = require("lazyvim.util")
      util.on_load("telescope.nvim", function()
        local telescope = require("telescope")
        telescope.load_extension("smart_open")
      end)
    end,
  },
  {
    "telescope.nvim",
    keys = {
      {
        "<leader><leader>",
        function()
          require("telescope").extensions.smart_open.smart_open({
            filename_first = false,
          })
        end,
        desc = "Telescope smart open",
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
    end,
  },
}
