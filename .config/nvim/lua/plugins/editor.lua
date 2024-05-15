return {
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "telescope.nvim",
    opts = {
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
        sorting_strategy = "ascending",
        winblend = 0,
        wrap_results = true,
        previewer = false,
        preview = {
          hide_on_startup = true,
        },
      },
    },
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
