local colors = require("shelman.colors")

local shelman = {
  visual = {
    a = { fg = colors.fg, bg = colors.selection, gui = "bold" },
    b = { fg = colors.fg, bg = colors.panel_bg },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.diff_mod, gui = "bold" },
    b = { fg = colors.fg, bg = colors.panel_bg },
  },
  inactive = {
    a = { fg = colors.fg, bg = colors.panel_bg, gui = "bold" },
    b = { fg = colors.fg, bg = colors.panel_bg },
    c = { fg = colors.fg, bg = colors.panel_bg },
  },
  normal = {
    a = { fg = colors.fg, bg = colors.panel_border, gui = "bold" },
    b = { fg = colors.panel_shadow, bg = colors.panel_bg },
    c = { fg = colors.fg, bg = colors.panel_bg },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.string, gui = "bold" },
    b = { fg = colors.string, bg = colors.panel_bg },
  },
}

return shelman
