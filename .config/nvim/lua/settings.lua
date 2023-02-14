vim.cmd([[set undofile]])
vim.cmd([[set completeopt-=preview]])
vim.cmd([[set viewoptions-=options]])
vim.g.mapleader = ","
vim.o.relativenumber = true
vim.o.hidden = true
vim.o.mouse = "a"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50
vim.o.updatetime = 100
vim.o.autochdir = false
vim.o.backupdir = "/home/lsjostrom/.local/share/nvim/backup/"
vim.o.backup = true
vim.o.clipboard = "unnamedplus"
vim.o.spell = false
vim.o.spelllang = "en_us"

-- enable nvim-0.7 faster filetype detection
vim.g.do_filetype_lua = 1

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
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.fillchars = "stl: ,stlnc: ,eob:🮙"
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
vim.o.cmdheight = 1

--- Key mappings
vim.keymap.set("n", "<leader>l", ':let @/ = ""<CR>', { noremap = true, silent = true }) -- clear search
vim.keymap.set("n", "H", "^", { silent = true }) -- move to start of line
vim.keymap.set("n", "L", "$", { silent = true }) -- move to end of line
vim.keymap.set("n", "<leader>q", ":bdelete!<CR>", { silent = true })
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":write!<CR>", { silent = true })
vim.keymap.set("i", "", "<C-w>", { silent = true })
vim.keymap.set("n", "<C-a>", "<ESC>ggVG$", { silent = true })
vim.keymap.set("v", "<C-s>", ":sort<CR>", { silent = true })

-- Terminal mappings
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-x>", ":split term://zsh<CR>")
