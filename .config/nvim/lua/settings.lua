vim.cmd([[set undofile]])
vim.cmd([[set completeopt-=preview]])
vim.cmd([[set viewoptions-=options]])
vim.g.mapleader = ","
vim.o.hidden = true
vim.o.mouse = "a"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50
vim.o.updatetime = 100
vim.o.autochdir = true
vim.o.backupdir = "/home/lsjostrom/.local/share/nvim/backup/"
vim.o.backup = true
vim.o.clipboard = "unnamedplus"

--- Indent
vim.o.autoindent = true
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.joinspaces = false
vim.o.listchars = "extends:›,precedes:‹,nbsp:·,tab:→ ,trail:·"
vim.wo.foldlevel = 99
vim.wo.linebreak = true
vim.wo.list = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.g.netrw_dirhistmax = 0

--- Search
vim.cmd("set path+=**")
vim.cmd("set wildignore+=*/tmp/*,/var/*,*.so,*.swp,*.zip,*.tar,*.pyc")
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildmode = "longest:full,full"

if vim.fn.executable("rg") then
	vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
end

--- Completion
vim.cmd("set shortmess+=c")
vim.o.completeopt = "menuone,noinsert,noselect"

--- Appearance
vim.o.background = "light"
vim.o.scrolloff = 8
vim.o.showmode = false
vim.o.sidescrolloff = 5
vim.o.termguicolors = true
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.o.laststatus = 3

--- Key mappings
vim.keymap.set("n", "<C-l>", ':let @/=""<CR>') -- clear search
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "<leader>q", ":bdelete!<CR>")
vim.keymap.set("n", "<leader>w", ":write!<CR>")
vim.keymap.set("i", "", "<C-w>")
vim.keymap.set("n", "<C-a>", "<ESC>ggVG$")

-- Terminal mappings
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-x>", ":split term://zsh<CR>")

-- recompile packer on plugins change
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
