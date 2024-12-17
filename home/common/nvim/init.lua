vim.env.RIPGREP_CONFIG_PATH = vim.env.HOME .. "/.config/ripgrep/ripgreprc"

vim.g.mapleader = ' '
vim.g.maplocalleader = ","

-- UI

vim.opt.cursorline = true
vim.opt.laststatus = 0
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
  local warn_string = warnings > 0 and "%#DiagnosticWarn# " .. warnings .. " " or "  "
  local error_string = errors > 0 and "%#DiagnosticError# " .. errors .. " " or "  "
  return warn_string .. error_string
end

vim.opt.rulerformat = "%40(%=%{%v:lua.GetIndicators()%}%#Label#│ %t %)"

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
-- vim.o.cia = 'kind,abbr,menu'
vim.o.fillchars = "stl: ,stlnc: ,eob:░,vert:│"
vim.o.icm = "split"
vim.o.list = false
vim.o.scrolloff = 7
vim.o.shada = vim.o.shada .. ',r~/.cargo/,r~/go/,r/nix/store/,r/run/,r/tmp/,rhealth:,rterm:'
vim.o.showcmd = false
vim.o.showmode = false
vim.o.smoothscroll = true
vim.o.splitkeep = "screen"
vim.o.timeoutlen = 10
vim.o.timeout = true
vim.o.updatetime = 50


-- Use rg
vim.o.grepprg = [[rg --glob "!.jj" --glob "!.git" --no-heading --vimgrep --follow $*]]
vim.opt.grepformat = vim.opt.grepformat ^ { "%f:%l:%c:%m" }

vim.fn.sign_define(
  "DiagnosticSignError",
  { text = "", hl = "DiagnosticSignError", texthl = "DiagnosticSignError", culhl = "DiagnosticSignErrorLine" }
)
vim.fn.sign_define(
  "DiagnosticSignWarn",
  { text = "", hl = "DiagnosticSignWarn", texthl = "DiagnosticSignWarn", culhl = "DiagnosticSignWarnLine" }
)
vim.fn.sign_define(
  "DiagnosticSignInfo",
  { text = "", hl = "DiagnosticSignInfo", texthl = "DiagnosticSignInfo", culhl = "DiagnosticSignInfoLine" }
)
vim.fn.sign_define(
  "DiagnosticSignHint",
  { text = "", hl = "DiagnosticSignHint", texthl = "DiagnosticSignHint", culhl = "DiagnosticSignHintLine" }
)


-- Make <Tab> work for snippets
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if vim.snippet.active({ direction = 1 }) then
    return "<cmd>lua vim.snippet.jump(1)<cr>"
  else
    return "<Tab>"
  end
end, { expr = true })


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
vim.keymap.set('n', '<Leader>b', "<cmd>Pick buffers<cr>", opts("Open buffer picker"))
vim.keymap.set('n', '<Leader>/', "<cmd>Pick grep_live_root<cr>", opts("Search workspace files"))
vim.keymap.set('n', '<Leader>d', "<cmd>Pick diagnostic<cr>", opts("Open diagnostics picker"))
vim.keymap.set("n", "<Leader>D", vim.diagnostic.setloclist, { desc = "Diagnostics to location list" })
vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts("Rename Symbol"))
vim.keymap.set('n', '<Leader>F', "<cmd>Pick files<cr>", opts("Open file picker CWD"))
vim.keymap.set('n', '<Leader>f', "<cmd>Pick files_root<cr>", opts("Open file picker"))
vim.keymap.set('n', '<c-p>', "<Leader>f", { remap = true })
vim.keymap.set('n', '<Leader>g', "<cmd>Pick oldfiles<cr>", opts("Open file picker history"))
vim.keymap.set("n", '<Leader>k', vim.lsp.buf.hover, opts("Show docs for item under cursor"))
vim.keymap.set('n', '<Leader>q', require('mini.bufremove').delete, opts("Delete buffer"))
vim.keymap.set('n', '<Leader>s', "<cmd>Pick lsp scope='document_symbol'<cr>", opts("Open symbol picker"))
vim.keymap.set('n', '<Leader>S', "<cmd>Pick lsp scope='workspace_symbol'<cr>", opts("Open workspace symbol picker"))
vim.keymap.set("n", "<Leader>ws", "<C-w>s", opts("Horizontal split"))
vim.keymap.set("n", "<Leader>wv", "<C-w>v", opts("Vertical split"))
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
vim.keymap.set("n", "<Leader>uh", "<cmd>InlayHintsToggle<cr>", opts("Toggle inlay hints"))

