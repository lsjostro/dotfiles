vim.env.RIPGREP_CONFIG_PATH = vim.env.HOME .. "/.config/ripgrep/ripgreprc"

vim.g.mapleader = ' '
vim.g.maplocalleader = ","

-- UI

vim.opt.cursorline = false
vim.opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.syntax = "on"
vim.opt.termguicolors = true

-- Ruler
function GetIndicators()
  local bufnr = vim.api.nvim_get_current_buf()
  local counts = vim.diagnostic.count(bufnr)
  local errors = counts[vim.diagnostic.severity.ERROR] or 0
  local warnings = counts[vim.diagnostic.severity.WARN] or 0
  local warn_string = warnings > 0 and "%#DiagnosticWarn# " .. warnings .. " " or ""
  local error_string = errors > 0 and "%#DiagnosticError# " .. errors .. " " or ""
  return warn_string .. error_string
end

function CondensedPath()
  local path = vim.fn.expand("%:p")
  local home = os.getenv("HOME")
  if home then
    path = vim.fn.substitute(path, '^' .. home, '~', '')
  end

  local segments = vim.fn.split(path, '/')
  if #segments <= 3 then
    return path
  end

  local early_path = table.concat(vim.list_slice(segments, 1, #segments - 2), '/')
  local late_path = table.concat(vim.list_slice(segments, #segments - 1), '/')

  return vim.fn.pathshorten(early_path) .. '/' .. late_path
end

vim.opt.statusline = "%{%v:lua.CondensedPath()%}%=%{%v:lua.GetIndicators()%}%7(%l:%c%)"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tab completion
-- vim.opt.wildmode="list:longest,full"
vim.opt.wildignore = '*.swp,*.o,*.so,*.exe,*.dll'

-- Whitespaces
vim.opt.breakindent = true
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = "tab:»·,trail:·"

-- Folds
vim.opt.foldenable = false
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--

vim.o.autochdir = true
vim.o.cia = 'kind,abbr,menu'
vim.o.fillchars = "stl: ,stlnc: ,eob:🮘,vert:│"
vim.o.icm = "split"
vim.o.list = false
vim.o.scrolloff = 7
vim.o.shada = vim.o.shada .. ',r~/.cargo/,r~/go/,r/nix/store/,r/run/,r/tmp/,rhealth:,rterm:'
vim.o.showcmd = false
vim.o.showmode = false
vim.o.smoothscroll = true
vim.o.splitkeep = "screen"
vim.o.timeout = false
vim.o.updatetime = 250

-- Use rg
vim.o.grepprg = [[rg --glob "!.jj" --glob "!.git" --no-heading --vimgrep --follow $*]]
vim.opt.grepformat = vim.opt.grepformat ^ { "%f:%l:%c:%m" }

-- Diagnostics
vim.diagnostic.config {
  float = { border = "rounded" },
  severity_sort = true,
  signs = {
    linehl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignErrorLine",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarnLine",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfoLine",
      [vim.diagnostic.severity.HINT] = "DiagnostigSignHintLine",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      [vim.diagnostic.severity.HINT] = "DiagnostigSignHint",
    },
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  virtual_lines = false,
}
vim.keymap.set('n', '<Space>ud', function()
  if vim.diagnostic.config().virtual_lines == true then
    -- vim.diagnostic.config({ virtual_lines = { current_line = true } })
    vim.diagnostic.config({ virtual_lines = false })
  else
    vim.diagnostic.config({ virtual_lines = true })
  end
end, { desc = 'Toggle diagnostic virtual_lines' })


-- Make <Tab> work for snippets
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if vim.snippet.active({ direction = 1 }) then
    return "<cmd>lua vim.snippet.jump(1)<cr>"
  else
    return "<Tab>"
  end
end, { expr = true })


-- Autoformat

vim.g.autoformat_enabled = true -- set to true by default

vim.api.nvim_create_user_command('ToggleAutoFormat', function()
  vim.g.autoformat_enabled = not vim.g.autoformat_enabled
  print('Autoformatting ' .. (vim.g.autoformat_enabled and 'enabled' or 'disabled'))
end, {})

vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "AutoFormat",
  callback = function()
    if vim.g.autoformat_enabled then
      vim.lsp.buf.format({
        async = false,
        timeout_ms = 2000 -- Adjust timeout as needed
      })
    end
  end,
})

-- Keymap
local opts = function(label)
  return { noremap = true, silent = true, desc = label }
end

-- Comments
vim.keymap.set("n", "<c-/>", "gcc", { remap = true })
vim.keymap.set("v", "<c-/>", "gc", { remap = true })
vim.keymap.set("n", "<c-_>", "gcc", { remap = true })
vim.keymap.set("v", "<c-_>", "gc", { remap = true })

vim.keymap.set({ "n", "v" }, "<Leader>a", vim.lsp.buf.code_action, { remap = true, desc = "Code action" })
vim.keymap.set("n", "<Leader>af", function()
  vim.lsp.buf.format({ async = true })
end, opts("Format Buffer"))
vim.keymap.set('n', '<Leader><Leader>', "<cmd>Pick visit_paths cwd=''<cr>", opts("Visits"))
vim.keymap.set('n', '<Leader>b', "<cmd>Pick buffers<cr>", opts("Open buffer picker"))
vim.keymap.set('n', '<Leader>/', "<cmd>Pick grep_live_root<cr>", opts("Search workspace files"))
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, opts("Show diagnostics for line"))
vim.keymap.set('n', '<m-d>', vim.diagnostic.open_float, opts("Show diagnostics for line"))
vim.keymap.set('n', '<Leader>D', function()
  local width = vim.o.columns - 8
  MiniExtra.pickers.diagnostic({ scope = "current" }, { window = { config = { width = width } } })
end, opts("Open diagnostics picker"))

vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts("Rename Symbol"))
vim.keymap.set('n', '<Leader>F', "<cmd>Pick files<cr>", opts("Open file picker CWD"))
vim.keymap.set('n', '<Leader>f', "<cmd>Pick files_root<cr>", opts("Open file picker"))
vim.keymap.set('n', '<c-p>', "<Leader>f", { remap = true })
vim.keymap.set('n', '<Leader>g', "<cmd>Pick oldfiles<cr>", opts("Open file picker history"))
vim.keymap.set("n", '<Leader>k', vim.lsp.buf.hover, opts("Show docs for item under cursor"))
vim.keymap.set('n', '<Leader>p', "<cmd>Pick projects<cr>", opts("Open projects picker"))
vim.keymap.set('n', '<Leader>q', require('mini.bufremove').delete, opts("Delete buffer"))
vim.keymap.set('n', '<Leader>s', "<cmd>Pick lsp scope='document_symbol'<cr>", opts("Open symbol picker"))
vim.keymap.set('n', '<Leader>S', "<cmd>Pick lsp scope='workspace_symbol'<cr>", opts("Open workspace symbol picker"))
vim.keymap.set("n", "<Leader>ws", "<C-w>s", opts("Horizontal split"))
vim.keymap.set("n", "<Leader>wv", "<C-w>v", opts("Vertical split"))
vim.keymap.set("n", "<m-f>", require('mini.files').open, opts("Open file manager"))
vim.keymap.set('n', '<tab>', "<cmd>Pick buffers include_current=false<cr>", opts("Buffers"))
vim.keymap.set("n", "zz", "zt", { remap = true })
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', opts("Yank to clipboard"))
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Declaration"))
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Definition"))
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Implementation"))
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Buffer References"))
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts("Type Definition"))
vim.keymap.set({ "n", "i" }, "<M-k>", vim.lsp.buf.signature_help, opts("Signature Help"))
vim.keymap.set({ "n", "v" }, "<Leader>aa", vim.lsp.buf.code_action, opts("Code Action"))
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover {
    border = 'rounded',
    max_height = 24,
    max_width = 80,
    offset_x = 2,
  }
end, {})
vim.keymap.set("n", "<Leader>ub", function()
  vim.o.background = (vim.o.background == "light" and "dark" or "light")
end, opts("Toggle dark/light background"))
vim.keymap.set("n", "<Leader>uc", function()
  if vim.g.colors_name == "dieter-nocolor" then
    vim.cmd [[colorscheme dieter]]
  else
    vim.cmd [[colorscheme dieter-nocolor]]
  end
end, opts("Toggle Dieter colors"))
vim.keymap.set("n", "<Leader>uf", "<cmd>ToggleAutoFormat<cr>", opts("Toggle autoformat on save"))
vim.keymap.set("n", "<Leader>uh", "<cmd>InlayHintsToggle<cr>", opts("Toggle inlay hints"))
vim.keymap.set("n", "<Leader>ul", "<cmd>set invcursorline<cr>", opts("Toggle cursor line"))
vim.keymap.set("n", "<Leader>un", "<cmd>set invnumber<cr>", opts("Toggle line numbers"))
vim.keymap.set("n", "<Leader>uw", "<cmd>set invwrap<cr>", opts("Toggle line wrapping"))

vim.keymap.set("n", "<Leader>ui", function()
  vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable
end, opts("Toggle indent scope"))
