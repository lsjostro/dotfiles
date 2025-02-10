local hsl = require("dieter.hsl").hslToHex

local colors = {
  light = {
    background = "NONE",
    foreground = "NONE",

    accent1 = hsl(12, 100, 50),

    dimmed = hsl(0, 0, 80),
    dimmed_subtle = hsl(0, 0, 20),

    highlight_subtle = hsl(0, 0, 94),
    highlight = hsl(0, 0, 90),
    highlight_intense = hsl(42, 100, 30),

    dialog_fg = hsl(230, 13, 10),

    string = hsl(96, 50, 33),
    comment = hsl(360, 66, 40),
    comment_error = hsl(2, 85, 40),

    suggestion = hsl(220, 95, 55),

    diagnostic_error = hsl(347, 80, 45),
    diagnostic_warning = hsl(30, 100, 50),
    diagnostic_info = hsl(145, 80, 30),
    diagnostic_hint = hsl(145, 80, 30),

    popup_error_bg = hsl(0, 90, 99),
    popup_warning_bg = hsl(27, 90, 99),
    popup_info_bg = hsl(112, 90, 99),
    popup_hint_bg = hsl(112, 90, 99),

    add = hsl(84, 50, 80),
    add_quarter = hsl(84, 80, 95),
    change = hsl(41, 80, 80),
    change_quarter = hsl(224, 100, 85),
    delete = hsl(350, 100, 40),

    selection = hsl(270, 75, 92),

    search_bg = hsl(43, 100, 8),
    search_fg = hsl(43, 100, 85),

    cmp_bg = hsl(218, 30, 97),
    cmp_fg = hsl(218, 30, 13),
    cmp_selected_fg = hsl(218, 50, 8),
    cmp_selected_bg = hsl(218, 30, 85),

    doc_bg = hsl(200, 30, 90),
    doc_fg = hsl(220, 80, 10),
  },

  dark = {
    background = "NONE",
    foreground = "NONE",

    accent1 = hsl(202, 57, 57), -- Blue
    accent2 = hsl(40, 57, 57),  -- Yellow

    dimmed = hsl(212, 19, 25),
    dimmed_subtle = hsl(212, 19, 50),

    highlight_subtle = hsl(212, 27, 11),
    highlight = hsl(212, 27, 18),
    highlight_intense = hsl(58, 100, 60),

    dialog_fg = hsl(191, 15, 75),

    string = hsl(90, 30, 60),
    comment = hsl(216, 30, 55),
    comment_error = hsl(2, 85, 50),
    func = hsl(40, 57, 87),
    member = hsl(213, 45, 75),
    punc = hsl(213, 45, 50),

    suggestion = hsl(158, 66, 40),

    diagnostic_error = hsl(353, 100, 45),
    diagnostic_warning = hsl(30, 100, 50),
    diagnostic_info = hsl(176, 80, 60),
    diagnostic_hint = hsl(210, 74, 60),

    popup_error_bg = hsl(0, 95, 7),
    popup_warning_bg = hsl(27, 95, 7),
    popup_info_bg = hsl(112, 95, 7),
    popup_hint_bg = hsl(112, 95, 7),

    add = hsl(100, 100, 12),
    add_quarter = hsl(84, 80, 15),
    change = hsl(41, 100, 15),
    change_quarter = hsl(224, 100, 15),
    delete = hsl(350, 100, 40),
    delete_quarter = hsl(350, 100, 15),

    selection = hsl(218, 90, 20),

    search_bg = hsl(43, 100, 8),
    search_fg = hsl(43, 100, 85),

    cmp_bg = hsl(218, 30, 13),
    cmp_fg = hsl(218, 30, 80),
    cmp_selected_bg = hsl(218, 30, 25),
    cmp_selected_fg = hsl(218, 50, 80),

    doc_bg = hsl(220, 80, 10),
    doc_fg = hsl(200, 30, 60),
  },

}

local setupGroups = function(c)
  c.dialog_bg = c.background

  return {
    Normal = { fg = c.foreground, bg = c.background },

    Constant = { link = "NormalNC" },
    Delimiter = { link = "NormalNC" },
    Function = { fg = c.func },
    Identifier = { link = "NormalNC" },
    Keyword = { fg = c.foreground, bold = true },
    Operator = { link = "NormalNC" },
    Special = { link = "NormalNC" },
    Type = { link = "NormalNC" },

    MsgArea = { fg = c.dimmed_subtle },

    String = { fg = c.string },

    Visual = { bg = c.selection },

    Search = { bg = c.search_bg, fg = c.search_fg },
    CurSearch = { link = "Search" },

    Comment = { fg = c.comment, italic = true },
    CommentError = { fg = c.comment_error, italic = true },
    ["@comment.note"] = { link = "Comment" },
    ["@comment.todo"] = { link = "CommentError" },
    ["@comment.error"] = { link = "CommentError" },
    ["@comment.warning"] = { link = "CommentError" },

    DiffAdd = { fg = c.add, bg = c.add_quarter },
    GitSignsAdd = { fg = c.add, bg = c.background },
    GitSignsAddNr = { link = "DiffAdd" },
    DiffChange = { fg = c.change, bg = c.change_quarter },
    GitSignsChange = { fg = c.change, bg = c.background },
    GitSignsChangeNr = { link = "DiffChange" },
    DiffDelete = { fg = c.delete, bg = c.delete_quarter },
    GitSignsDelete = { fg = c.delete, bg = c.background },
    GitSignsDeleteNr = { link = "DiffDelete" },

    -- Treesitter
    ["@punctuation.special"] = { fg = c.punc },
    ["@special"] = { link = "NormalNC" },
    ["@variable"] = { link = "NormalNC" },
    ["@variable.member"] = { fg = c.member },
    ["@variable.parameter"] = { fg = c.accent2 },

    -- UI Elements
    CursorLine = { bg = c.highlight_subtle },

    DiagnosticError = { fg = c.diagnostic_error, italic = true },
    DiagnosticHint = { fg = c.diagnostic_hint, italic = true },
    DiagnosticInfo = { fg = c.diagnostic_info, italic = true },
    DiagnosticWarn = { fg = c.diagnostic_warn, italic = true },
    DiagnosticFloatingError = { fg = c.diagnostic_error, bg = c.popup_error_bg },
    DiagnosticFloatingHint = { fg = c.diagnostic_hint, bg = c.popup_hint_bg },
    DiagnosticFloatingInfo = { fg = c.diagnostic_info, bg = c.popup_info_bg },
    DiagnosticFloatingWarn = { fg = c.diagnostic_warning, bg = c.popup_warning_bg },
    DiagnosticUnderlineError = { fg = c.foreground, undercurl = true, sp = c.diagnostic_error },
    DiagnosticUnderlineHint = { fg = c.foreground, undercurl = true, sp = c.diagnostic_hint },
    DiagnosticUnderlineInfo = { fg = c.foreground, undercurl = true, sp = c.diagnostic_info },
    DiagnosticUnderlineWarn = { fg = c.foreground, undercurl = true, sp = c.diagnostic_warn },

    DiagnosticSignError = { fg = c.diagnostic_error },
    DiagnosticSignHint = { fg = c.diagnostic_hint },
    DiagnosticSignInfo = { fg = c.diagnostic_info },
    DiagnosticSignWarn = { fg = c.diagnostic_warning },
    LineNr = { fg = c.dimmed },
    CursorLineNr = { fg = c.dimmed_subtle, bg = c.highlight_subtle },

    IndentLine = { fg = c.highlight },
    IndentLineCurrent = { fg = c.highlight },
    MiniIndentscopeSymbol = { link = "IndentLine" },
    MiniIndentscopeSymbolOff = { link = "IndentLine" },

    TreesitterContext = { reverse = true },
    TreesitterContextLineNumber = { bg = c.dimmed, reverse = true, italic = true },
    InclineNormal = { bg = c.background },
    InclineNormalNC = { bg = c.background },

    EndOfBuffer = { fg = c.dimmed },
    WinSeparator = { bg = c.dialog_bg, fg = c.dialog_fg },
    NormalFloat = { bg = c.background, fg = c.foreground },
    FloatBorder = { fg = c.foreground },
    FloatTitle = { fg = c.doc_fg, bold = true },

    Title = { fg = c.foreground, bold = true },

    MiniPickNormal = { bg = c.dialog_bg, fg = c.dialog_fg },
    MiniPickBorder = { link = "MiniPickNormal" },
    MiniPickBorderText = { link = "MiniPickBorder" },
    MiniPickMatchCurrent = { bg = c.dialog_bg, fg = c.dialog_fg, reverse = true },

    MiniClueBorder = { link = "MiniPicBorder" },
    MiniClueTitle = { bg = c.background, fg = c.foreground, bold = true },
    MiniClueNextKey = { link = "MiniClueTitle" },
    MiniClueDescGroup = { bg = c.background, fg = c.foreground, italic = true },
    MiniClueDescSingle = { bg = c.background, fg = c.foreground },
    MiniClueSeparator = { link = "MiniClueBorder" },

    MiniCursorWord = { underdotted = true, bold = true, sp = c.diagnostic_hint },

    MiniStarterCurrent = { link = "MiniPickMatchCurrent" },

    BlinkCmpMenu = { bg = c.cmp_bg, fg = c.cmp_fg },
    BlinkCmpMenuSelection = { bg = c.cmp_selected_bg, fg = c.cmp_selected_fg, reverse = false },
    BlinkCmpMenuBorder = { bg = c.cmp_bg, fg = c.cmp_fg },
    BlinkCmpLabel = { link = 'BlinkCmpMenu' },
    BlinkCmpLabelMatch = { link = 'BlinkCmpMenu', underline = true },

    BlinkCmpDoc = { bg = c.doc_bg, fg = c.foreground },
    BlinkCmpDocBorder = { bg = c.doc_bg, fg = c.doc_fg },
    BlinkCmpDocDetail = { link = 'BlinkCmpDoc' },
    BlinkCmpSignatureHelp = { link = 'BlinkCmpDoc' },
    BlinkCmpSignatureHelpBorder = { link = 'BlinkCmpDocBorder' },

    BlinkCmpGhostText = { fg = c.suggestion, italic = true, bold = true },
    NeoCodeiumSuggestion = { link = 'BlinkCmpGhostText' },

    LspReferenceText = { fg = c.highlight_intense, undercurl = true },
    LspInlayHint = { fg = c.accent1, italic = true, bold = true },
  }
end


local setupGroupsNoColor = function(c)
  local g = setupGroups(c)
  local cl = { link = "NormalNC" }
  g.Constant = cl
  g.Delimiter = cl
  g.Function = cl
  g.Identifier = cl
  g.Keyword = cl
  g.Operator = cl
  g["@punctuation.special"] = cl
  g["@special"] = cl
  g["@string"] = cl
  g["@lsp.type.string"] = cl
  g.Special = cl
  g.String = cl
  g.Type = cl
  g.Variable = cl
  g["@variable"] = cl
  g["@variable.member"] = cl
  g["@variable.parameter"] = cl
  -- g.Comment = { fg = c.dimmed_subtle, italic = true, bold = true }
  g.CommentError = { link = "Comment" }
  return g
end

local setup_common = function(groups)
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  for group, hl in pairs(groups) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

local T = {}

T.setup = function()
  local c = colors[vim.o.background]
  local groups = setupGroups(c)
  setup_common(groups)
  vim.g.colors_name = "dieter"
end

T.setup_nocolor = function()
  local c = colors[vim.o.background]
  local groups = setupGroupsNoColor(c)
  setup_common(groups)
  vim.g.colors_name = "dieter-nocolor"
end

return T
