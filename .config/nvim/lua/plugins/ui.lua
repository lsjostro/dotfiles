local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  local Color, colors, Group, _, styles = require("colorbuddy").setup()
  Color.new("IndentBlanklineIndent", "#7698c6", styles.nocombine)
  Group.new("IndentBlanklineIndent1", colors.IndentBlanklineIndent:light(0.1))
  Group.new("IndentBlanklineIndent2", colors.IndentBlanklineIndent:light(0.15))
  Group.new("IndentBlanklineIndent3", colors.IndentBlanklineIndent:light(0.2))
  Group.new("IndentBlanklineIndent4", colors.IndentBlanklineIndent:light(0.25))
  Group.new("IndentBlanklineIndent5", colors.IndentBlanklineIndent:light(0.3))
  Group.new("IndentBlanklineIndent6", colors.IndentBlanklineIndent:light(0.35))

  Color.new("IndentBlanklineContextChar", "#f0a972", styles.nocombine)
  Group.new("IndentBlanklineContextChar", colors.IndentBlanklineContextChar)
end)

return {
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
        highlight = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      },
      scope = {
        enabled = true,
        show_start = false,
        char = "│",
        highlight = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
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
