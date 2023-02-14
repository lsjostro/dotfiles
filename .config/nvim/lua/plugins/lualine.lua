local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  event = "VeryLazy",
}

local function clock()
  return os.date("%H:%M")
end

function M.config()
  local lualine = require("lualine")


  lualine.setup({
    options = {
      globalstatus = true,
      -- theme = "onelight",
      component_separators = { left = "╲", right = "╱" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1,
          file_status = true,
        },
      },
      lualine_x = { "filetype" },
      lualine_y = { "location", "progress" },
      lualine_z = { clock },
    },
  })
end

return M
