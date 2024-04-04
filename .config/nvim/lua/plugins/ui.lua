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
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup({
        window = {
          margin = {
            horizontal = 0,
            vertical = 0,
          },
          padding = 0,
          placement = {
            horizontal = "right",
            vertical = "bottom",
          },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end

          local function get_git_diff()
            local icons = { delete = " ", change = " ", add = " " }
            local summary = vim.b.minidiff_summary
            local labels = {}
            if summary == nil then
              return labels
            end
            for name, icon in pairs(icons) do
              if tonumber(summary[name]) and summary[name] > 0 then
                table.insert(labels, { icon .. summary[name] .. " ", group = "MiniDiffSign" .. name })
              end
            end
            if #labels > 0 then
              table.insert(labels, { "╱ " })
            end
            return labels
          end

          local function get_diagnostic_label()
            local icons = { error = " ", warn = "󰀪 ", info = " ", hint = " " }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { "╱ " })
            end
            return label
          end

          local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

          return {
            { filetype_icon, guifg = color },
            { " ╱ " },
            { get_diagnostic_label() },
            { get_git_diff() },
            { filename, gui = "italic" },
          }
        end,
      })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
