vim.g.zenbones = {
	style = "light",
	lightness = "bright",
	colorize_diagnostic_underline_text = true,
	transparent_background = true,
	zenbones_compat = 1,
}

local lush = require("lush")
local base = require("zenbones")

-- Create some specs
local specs = lush.parse(function()
	return {
		CursorLine({ bg = "#f5f5f0" }),
		CursorLineNr({ fg = "#BCAAA4", bg = "#f5f5f0" }),
		TabLineSel({ fg = "#BCAAA4", bg = "#f5f5f0" }),
		MsgArea({ fg = "#A1887F", bg = "#f1f1f1" }),
		String({ fg = "#33691E", gui = "italic" }),
		Comment({ fg = "#114499", gui = "bold,italic" }),
		LineNr({ fg = "#CFD8DC", gui = "bold,italic" }),
		Indent1({ fg = "#FFEBEE", gui = "italic" }),
		Indent2({ fg = "#E8F5E9", gui = "italic" }),
		Indent3({ fg = "#E8F5E9", gui = "italic" }),
		Indent4({ fg = "#FFF3E0", gui = "italic" }),
		Indent5({ fg = "#E0F7FA", gui = "italic" }),
		Indent6({ fg = "#F3E5F5", gui = "italic" }),
		NormalFloat({ bg = "#FFF9C4" }),
		FloatBorder({ fg = "#FFB74D", bg = "#FFF9C4" }),
		TelescopeNormal({ bg = "#EFEBE9" }),
		TelescopeBorder({ fg = "#A1887F", bg = "#EFEBE9" }),
		TelescopeSelection({ fg = "#FFFFFF", bg = "#1976D2" }),
		DiagnosticVirtualTextInfo({ fg = "#0033bb", bg = "#f7fcff", gui = "bold,italic" }),
		DiagnosticVirtualTextWarn({ fg = "#bb2200", bg = "#fff9f3", gui = "bold,italic" }),
		DiagnosticVirtualTextError({ fg = "#ff2200", bg = "#fff5f3", gui = "italic" }),
		DiagnosticUnderlineError({ fg = "#ff0000", gui = "undercurl" }),
		DiagnosticUnderlineWarn({ fg = "#ff7700", gui = "undercurl" }),
		DiagnosticUnderlineInfo({ fg = "#3366cc", gui = "undercurl" }),
		MarkSignHL({ fg = "#009688", bg = "#E0F7FA" }),
		MarkSignNumHL({ fg = "#B2DFDB", bg = "#E0F7FA" }),
		GitSignsAdd({ fg = "#81C784" }),
		GitSignsAddNr({ fg = "#C8E6C9" }),
		GitSignsDelete({ fg = "#E53935" }),
		GitSignsDeleteNr({ fg = "#FFCDD2" }),
		GitSignsChange({ fg = "#FFA726" }),
		GitSignsChangeNr({ fg = "#FFE0B2" }),
		PMenu({ bg = "#F7F5F0" }),
		PMenuBorder({ bg = "#F7F5F0", fg = "#886622" }),
		PMenuSel({ fg = "#FFFFFF", bg = "#1976D2" }),
		PMenuSbar({ bg = "#90CAF9" }),
		PMenuThumb({ bg = "#64B5F6" }),
		StatusLine({ base = base.VertSplit, fg = "#BCAAA4" }),
		StatusLineNC({ base = base.VertSplit, fg = "#BCAAA4" }),
		TreesitterContext({ bg = "#f0f0f0", fg = "#BCAAA4", gui = "bold,italic" }),
		TreesitterContextLineNumber({ bg = "#f0f0f0", fg = "#979770", gui = "bold,italic" }),
	}
end)

-- Apply specs using lush tool-chain
vim.cmd("colorscheme zenbones")
lush.apply(lush.compile(specs))
