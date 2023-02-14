local M = {
  "mcchrish/zenbones.nvim",
  dependencies = {
    "rktjmp/lush.nvim",
  },
}

function M.config()
  vim.g.zenbones = {
    style = "light",
    lightness = "bright",
    colorize_diagnostic_underline_text = true,
    transparent_background = true,
  }

  local lush = require("lush")
  local base = require("zenbones")

  -- Create some specs
  ---@diagnostic disable = undefined-global
  local specs = lush.parse(function(injected_functions)
    -- See https://github.com/rktjmp/lush.nvim/issues/109
    local sym = injected_functions.sym

    return {
      CursorLine({ bg = "#f5f5f0" }),
      Error({ fg = "#d9534f" }),
      CursorLineNr({ fg = "#BCAAA4", bg = "#f5f5f0" }),
      MsgArea({ fg = "#A1887F", bg = "#f1f1f1" }),
      String({ fg = "#5E8122", gui = "italic" }),
      Number({ fg = "#32936F" }),
      sym("@field")({ fg = "#6F62A7" }),
      sym("@string")({ fg = "#5B7B3D", gui = "italic" }),
      sym("@type.definition")({ fg = "#B6465F", gui = "bold" }),
      sym("@function")({ fg = "#8C1831", gui = "bold" }),
      sym("@method")(sym("@function")),
      Comment({ fg = "#8F001D", gui = "bold,italic" }),
      Todo({ fg = "#FF0000", gui = "bold,underline" }),
      EndOfBuffer({ fg = "#CBCFE1" }),
      LineNr({ fg = "#9FA8AC", gui = "bold,italic" }),
      LineNrAbove({ fg = "#9FA8AC", gui = "bold,italic" }),
      PMenu({ bg = "#F7F5F0" }),
      PMenuBorder({ bg = "#F7F5F0", fg = "#886622" }),
      PMenuSel({ fg = "#FFFFFF", bg = "#1976D2" }),
      PMenuSbar({ bg = "#90CAF9" }),
      PMenuThumb({ bg = "#64B5F6" }),
      StatusLine({ base = base.VertSplit, fg = "#BCAAA4" }),
      StatusLineNC({ base = base.VertSplit, fg = "#BCAAA4" }),
      TreesitterContext({ bg = "#f0f0f0", fg = "#BCAAA4", gui = "bold,italic" }),
      TreesitterContextLineNumber({ bg = "#f0f0f0", fg = "#979770", gui = "bold,italic" }),

      -- Lsp
      DiagnosticSignError({ fg = "#ff2200", bg = "#fff5ff", gui = "bold" }),
      DiagnosticVirtualTextInfo({ fg = "#0033bb", bg = "#f7fcff", gui = "bold,italic" }),
      DiagnosticVirtualTextWarn({ fg = "#bb2200", bg = "#fff9f3", gui = "bold,italic" }),
      DiagnosticVirtualTextError({ fg = "#ff2200", bg = "#fff5f3", gui = "italic" }),
      DiagnosticUnderlineError({ fg = "#ff0000", gui = "undercurl" }),
      DiagnosticUnderlineWarn({ fg = "#ff7700", gui = "undercurl" }),
      DiagnosticUnderlineInfo({ fg = "#3366cc", gui = "undercurl" }),

      -- Indent blank plugin
      IndentBlanklineContextChar({ fg = "#699FB5", gui = "italic" }),
      Indent1({ fg = "#DFDF9A", gui = "italic" }),
      Indent2({ fg = "#BAE1FF", gui = "italic" }),
      Indent3({ fg = "#BAFFC9", gui = "italic" }),
      Indent4({ fg = "#FFB3BA", gui = "italic" }),
      Indent5({ fg = "#FFDFBA", gui = "italic" }),
      Indent6({ fg = "#F3E5F5", gui = "italic" }),

      NormalFloat({ bg = "#FFF9C4" }),
      FloatBorder({ fg = "#FFB74D", bg = "#FFF9C4" }),

      -- copilot ghost text
      CopilotSuggestion({ fg = "#0066cc", gui = "bold,italic" }),

      TelescopeNormal({ bg = "#EFEBE9" }),
      TelescopeBorder({ fg = "#A1887F", bg = "#EFEBE9" }),
      TelescopeSelection({ fg = "#FFFFFF", bg = "#1976D2" }),

      MarkSignHL({ fg = "#009688", bg = "#E0F7FA" }),
      MarkSignNumHL({ fg = "#B2DFDB", bg = "#E0F7FA" }),

      GitSignsAdd({ fg = "#81C784" }),
      GitSignsAddNr({ fg = "#C8E6C9" }),
      GitSignsDelete({ fg = "#E53935" }),
      GitSignsDeleteNr({ fg = "#FFCDD2" }),
      GitSignsChange({ fg = "#FFA726" }),
      GitSignsChangeNr({ fg = "#FFE0B2" }),

      Hlargs({ fg = "#2274A5" }),

      IlluminatedWordText({ bg = "#FFEE99" }),
      NotifyBackground({ bg = "#FFF8D6" }),

      NoiceCmdlinePopup({ bg = "#E1F5FE" }),
      NoiceMini({ bg = "#FFF9C4" }),
    }
  end)

  -- Apply specs using lush tool-chain
  vim.cmd("colorscheme zenbones")
  lush.apply(lush.compile(specs))
end

return M
