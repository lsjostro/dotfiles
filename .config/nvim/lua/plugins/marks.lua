return {
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      local marks = require("marks")
      marks.setup({
        default_mappings = true,
        cyclic = true,
        force_write_shada = false,
        excluded_filetypes = {},
        bookmark_1 = {
          sign = "⚑",
          virt_text = "",
        },
      })
    end
  }
}
