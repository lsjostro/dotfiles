local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
local highlight = {
  "IndentBlanklineIndent1",
  "IndentBlanklineIndent2",
  "IndentBlanklineIndent3",
  "IndentBlanklineIndent4",
  "IndentBlanklineIndent5",
  "IndentBlanklineIndent6",
}
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  local colorbuddy = require("colorbuddy")
  local Color = colorbuddy.Color
  local Group = colorbuddy.Group

  local c = colorbuddy.colors
  local s = colorbuddy.styles
  Color.new("IndentBlanklineIndent", "#7698c6", s.nocombine)
  Group.new("IndentBlanklineIndent1", c.IndentBlanklineIndent:light())
  Group.new("IndentBlanklineIndent2", c.IndentBlanklineIndent:light():light())
  Group.new("IndentBlanklineIndent3", c.IndentBlanklineIndent:light():light():light())
  Group.new("IndentBlanklineIndent4", c.IndentBlanklineIndent:light():light():light())
  Group.new("IndentBlanklineIndent5", c.IndentBlanklineIndent:light():light():light())
  Group.new("IndentBlanklineIndent6", c.IndentBlanklineIndent:light():light():light())
end)

return {
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 10,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
      { "tjdevries/colorbuddy.nvim" },
    },
    main = "ibl",
    opts = {
      indent = {
        char = "┊",
        tab_char = "┊",
        highlight = highlight,
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 1500,
    },
  },
}
