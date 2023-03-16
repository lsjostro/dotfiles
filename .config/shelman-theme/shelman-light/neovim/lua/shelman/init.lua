local colors = require("shelman.colors")
local config = require("shelman.config")
local shelman = {}

--- Apply terminal highlighting.
local function set_terminal_colors()
  vim.g.terminal_color_0 = colors.ansi_black
  vim.g.terminal_color_1 = colors.ansi_red
  vim.g.terminal_color_2 = colors.ansi_green
  vim.g.terminal_color_3 = colors.ansi_yellow
  vim.g.terminal_color_4 = colors.ansi_blue
  vim.g.terminal_color_5 = colors.ansi_magenta
  vim.g.terminal_color_6 = colors.ansi_cyan
  vim.g.terminal_color_7 = colors.ansi_white
  vim.g.terminal_color_8 = colors.ansi_bright_black
  vim.g.terminal_color_9 = colors.ansi_bright_red
  vim.g.terminal_color_10 = colors.ansi_bright_green
  vim.g.terminal_color_11 = colors.ansi_bright_yellow
  vim.g.terminal_color_12 = colors.ansi_bright_blue
  vim.g.terminal_color_13 = colors.ansi_bright_magenta
  vim.g.terminal_color_14 = colors.ansi_bright_cyan
  vim.g.terminal_color_15 = colors.ansi_bright_white
  vim.g.terminal_color_background = colors.bg
  vim.g.terminal_color_foreground = colors.fg
end

--- Apply groups highlighting.
local function set_groups()
  local groups = {
    -- Base.
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { bg = colors.panel_bg },
    FloatBorder = { fg = colors.panel_border, bg = colors.panel_bg },
    FloatTitle = { fg = colors.fg, bg = colors.panel_bg },
    ColorColumn = { bg = colors.line },
    Cursor = { fg = colors.bg, bg = colors.fg },
    CursorColumn = { bg = colors.line },
    CursorLine = { bg = colors.line },
    CursorLineNr = { fg = colors.line_nr_cursor, bg = colors.line, bold = true, italic = true },
    LineNr = { fg = colors.line_nr, bold = true, italic = true },
    LineNrAbove = { fg = colors.line_nr_above, bold = true, italic = true },
    LineNrBelow = { fg = colors.line_nr_below, bold = true, italic = true },
    EndOfBuffer = { fg = colors.line_nr_below },
    Directory = { fg = colors.func },
    ErrorMsg = { fg = colors.error },
    VertSplit = { fg = colors.panel_border, bg = colors.bg },
    Folded = { fg = colors.fg_idle, bg = colors.panel_bg },
    FoldColumn = { bg = colors.bg },
    SignColumn = { bg = colors.bg },
    MatchParen = { sp = colors.func, underline = true },
    ModeMsg = { fg = colors.string },
    MoreMsg = { fg = colors.string },
    NonText = { fg = colors.guide_normal },
    Pmenu = { fg = colors.fg, bg = colors.panel_bg },
    PmenuSel = { fg = colors.fg, bg = colors.panel_bg, reverse = true },
    Question = { fg = colors.string },
    Search = { fg = colors.search_fg, bg = colors.search_bg },
    CurSearch = { fg = colors.search_fg, bg = colors.search_bg },
    IncSearch = { fg = colors.search_fg, bg = colors.search_bg },
    SpecialKey = { fg = colors.selection_inactive },
    SpellCap = { sp = colors.field, undercurl = true },
    SpellLocal = { sp = colors.keyword, undercurl = true },
    SpellBad = { sp = colors.error, undercurl = true },
    -- SpellRare = { sp = colors.regexp, undercurl = true },
    StatusLine = { fg = colors.fg, bg = colors.panel_bg },
    StatusLineNC = { fg = colors.fg_idle, bg = colors.panel_bg },
    -- WildMenu = { fg = colors.fg, bg = colors.markup },
    TabLine = { fg = colors.comment, bg = colors.panel_shadow },
    TabLineFill = { fg = colors.fg, bg = colors.panel_border },
    TabLineSel = { fg = colors.fg, bg = colors.bg },
    Title = { fg = colors.keyword },
    Visual = { bg = colors.selection },
    WarningMsg = { fg = colors.warning },
    Comment = { fg = colors.comment, bold = true, italic = true },
    Constant = { fg = colors.constant },
    String = { fg = colors.string, italic = true },
    Identifier = { fg = colors.identifier },
    Function = { fg = colors.func, bold = true },
    Operator = { fg = colors.operator },
    Number = { fg = colors.number, italic = true },
    -- Exception = { fg = colors.markup },
    PreProc = { fg = colors.accent },
    Type = { fg = colors.type },
    Statement = { fg = colors.keyword, bold = true },
    Structure = { fg = colors.special },
    Special = { fg = colors.accent },
    Delimiter = { fg = colors.special },
    Underlined = { sp = colors.field, underline = true },
    Ignore = { fg = colors.fg },
    Error = { fg = colors.ansi_white, bg = colors.error },
    Todo = { fg = colors.todo },
    qfLineNr = { fg = colors.keyword },
    qfError = { fg = colors.error },
    Conceal = { fg = colors.comment },
    -- CursorLineConceal = { fg = colors.guide_normal, bg = colors.line },
    DiffAdd = { bg = colors.diff_add_bg },
    DiffAdded = { fg = colors.diff_add },
    DiffDelete = { bg = colors.diff_del_bg },
    DiffRemoved = { fg = colors.diff_del },
    -- DiffText = { bg = colors.gutter_normal },
    DiffChange = { bg = colors.selection_inactive },
    -- -- LSP.
    DiagnosticError = { fg = colors.error, bg = colors.error_bg, italic = true },
    DiagnosticWarn = { fg = colors.keyword, bg = colors.warning_bg, bold = true, italic = true },
    DiagnosticInfo = { fg = colors.field, bold = true, italic = true },
    -- DiagnosticHint = { fg = colors.regexp },
    DiagnosticUnderlineError = { sp = colors.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = colors.warning, undercurl = true },
    DiagnosticUnderlineInfo = { sp = colors.field, undercurl = true },
    -- DiagnosticUnderlineHint = { sp = colors.regexp, undercurl = true },
    -- -- Markdown.
    markdownCode = { fg = colors.special },
    -- -- TreeSitter.
    ["@property"] = { fg = colors.field },
    ["@field"] = { fg = colors.field },
    ["@parameter"] = { fg = colors.fg },
    ["@namespace"] = { fg = colors.ident },
    ["@variable.builtin"] = { fg = colors.func },
    ["@text.title"] = { fg = colors.keyword },
    ["@type.definition"] = { fg = colors.type, bold = true },
    ["@type.qualifier"] = { fg = colors.keyword },
    ["@storageclass"] = { fg = colors.keyword },
    ["@tag"] = { fg = colors.keyword },
    ["@tag.attribute"] = { fg = colors.identifier },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@variable"] = { fg = colors.fg },
    -- -- Copilot
    CopilotSuggestion = { fg = colors.string, bold = true, italic = true },
    -- -- Gitsigns.
    GitSignsAdd = { fg = colors.diff_add, bold = true, italic = true },
    GitSignsDelete = { fg = colors.diff_del, bold = true, italic = true },
    GitSignsChange = { fg = colors.diff_mod, bold = true, italic = true },
    -- -- Telescope.
    TelescopeBorder = { fg = colors.panel_border, bg = colors.panel_bg },
    TelescopeNormal = { bg = colors.panel_bg },
    TelescopePromptBorder = { fg = colors.panel_border, bg = colors.panel_bg },
    -- -- Cmp.
    CmpItemAbbrMatch = { fg = colors.keyword },
    CmpItemAbbrMatchFuzzy = { fg = colors.func },
    CmpItemKindText = { fg = colors.string },
    CmpItemKindMethod = { fg = colors.keyword },
    CmpItemKindFunction = { fg = colors.func },
    CmpItemKindConstructor = { fg = colors.keyword },
    CmpItemKindField = { fg = colors.identifier },
    CmpItemKindVariable = { fg = colors.field },
    CmpItemKindClass = { fg = colors.identifier },
    CmpItemKindInterface = { fg = colors.identifier },
    CmpItemKindModule = { fg = colors.keyword },
    CmpItemKindProperty = { fg = colors.keyword },
    CmpItemKindUnit = { fg = colors.constant },
    CmpItemKindValue = { fg = colors.constant },
    CmpItemKindEnum = { fg = colors.identifier },
    CmpItemKindKeyword = { fg = colors.keyword },
    -- CmpItemKindSnippet = { fg = colors.regexp },
    CmpItemKindColor = { fg = colors.special },
    CmpItemKindFile = { fg = colors.special },
    CmpItemKindReference = { fg = colors.special },
    CmpItemKindFolder = { fg = colors.special },
    CmpItemKindEnumMember = { fg = colors.constant },
    CmpItemKindConstant = { fg = colors.constant },
    CmpItemKindStruct = { fg = colors.identifier },
    CmpItemKindEvent = { fg = colors.field },
    CmpItemKindOperator = { fg = colors.operator },
    CmpItemKindTypeParameter = { fg = colors.field },
    CmpItemMenu = { fg = colors.comment },
    -- -- Word under cursor.
    CursorWord = { bg = colors.selection_inactive },
    CursorWord0 = { bg = colors.selection_inactive },
    CursorWord1 = { bg = colors.selection_inactive },
    -- -- Noice
    NoiceLspProgressTitle = { fg = colors.fg },
    NoiceLspProgressClient = { fg = colors.special },
    -- -- Indent blankline.
    IndentBlanklineContextChar = { fg = colors.indent_guide, underline = false, italic = true },
    Indent1 = { fg = colors.indent1, italic = true, underline = false },
    Indent2 = { fg = colors.indent2, italic = true, underline = false },
    Indent3 = { fg = colors.indent3, italic = true, underline = false },
    Indent4 = { fg = colors.indent4, italic = true, underline = false },
    Indent5 = { fg = colors.indent5, italic = true, underline = false },
    Indent6 = { fg = colors.indent6, italic = true, underline = false },
    -- -- LSP Signature.
    LspSignatureActiveParameter = { italic = true },
    -- -- Notify.
    NotifyERROR = { fg = colors.diff_del },
    NotifyWARN = { fg = colors.func },
    NotifyINFO = { fg = colors.diff_add },
    NotifyDEBUG = { fg = colors.comment },
    NotifyTRACE = { fg = colors.diff_mod },
    NotifyERRORTitle = { fg = colors.error },
    NotifyWARNTitle = { fg = colors.warning },
    NotifyINFOTitle = { fg = colors.string },
    NotifyDEBUGTitle = { fg = colors.fg },
    NotifyTRACETitle = { fg = colors.identifier },
    -- -- Dap.
    NvimDapVirtualText = { fg = colors.comment },
  }

  groups =
      vim.tbl_extend("force", groups, type(config.overrides) == "function" and config.overrides() or config.overrides)

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

--- Apply user settings.
---@param values table
function shelman.setup(values)
  setmetatable(config, { __index = vim.tbl_extend("force", config.defaults, values) })
end

--- Set the colorscheme.
function shelman.colorscheme()
  if vim.version().minor < 8 then
    vim.notify(
      "Neovim 0.8+ is required for shelman colorscheme",
      vim.log.levels.ERROR,
      { title = "Shelman colorscheme" }
    )
    return
  end

  vim.api.nvim_command("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "shelman"

  set_terminal_colors()
  set_groups()
end

return shelman
