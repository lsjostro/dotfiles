vim.cmd[[set undofile]]
vim.cmd[[set completeopt-=preview]]
vim.cmd[[set viewoptions-=options]]
vim.g.mapleader = ','
vim.o.hidden = true
vim.o.mouse = 'a'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50
vim.o.updatetime = 100
vim.o.autochdir = true
vim.o.backupdir = "/home/lsjostrom/.local/share/nvim/backup/"
vim.o.backup = true

--- Indent
vim.bo.autoindent = true
vim.o.breakindent = true
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.o.joinspaces = false
vim.o.listchars = 'extends:›,precedes:‹,nbsp:·,tab:→ ,trail:·'
vim.wo.foldlevel = 99
vim.wo.linebreak = true
vim.wo.list = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2

--- Search
vim.cmd('set path+=**')
vim.cmd('set wildignore+=*/tmp/*,/var/*,*.so,*.swp,*.zip,*.tar,*.pyc')
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildmode = 'longest:full,full'

if vim.fn.executable('rg') then
	vim.o.grepprg = 'rg --vimgrep --no-heading --smart-case'
end

--- Completion
vim.cmd('set shortmess+=c')
vim.o.completeopt = 'menuone,noinsert,noselect'

--- Appearance
vim.o.background = 'light'
vim.o.scrolloff = 8
vim.o.showmode = false
vim.o.sidescrolloff = 5
vim.o.termguicolors = true
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.o.laststatus = 0

--- Key mappings
local map = require("lsjostrom.utils").map
map('n', '<C-l>', ':let @/=""<CR>')  -- clear search
map('n', 'H', '^')
map('n', 'L', '$')
map('n', ',q', ':bd!<CR>')
map('n', ',w', ':w!<CR>')
map('i', '', '<C-w>')

--- Plugins
vim.g.netrw_dirhistmax = 0

require('plugins')


local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border })

-- vim.cmd [[nnoremap <buffer><silent> <C-space> :lua vim.lsp.diagnostic.show_line_diagnostics({ border = border })<CR>]]
-- vim.cmd [[nnoremap <buffer><silent> ]g :lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = border }})<CR>]]
-- vim.cmd [[nnoremap <buffer><silent> [g :lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "round" }})<CR>]]

