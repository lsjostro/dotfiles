" ========================================
" Vim plugin configuration
" ========================================
" Install:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

"""""""""""""""""""" MY VUNDLES """""""""""""""""""""""
" Make Git pervasive in vim ( :Gblame + Glog + many more )
Plugin 'tpope/vim-fugitive'

" awesome syntax highlighting
Plugin 'scrooloose/syntastic'

" Command+T replacement (ctrl+P)
Plugin 'kien/ctrlp.vim'

" comment lines out (gc in visual mode)
Plugin 'tomtom/tcomment_vim.git'

" Make it look amazing
Plugin 'altercation/vim-colors-solarized'

" Pimped out bar at the bottom of current buffer
Plugin 'bling/vim-airline.git'

" Search everything in the current dir via :Ack
Plugin 'mileszs/ack.vim'

" Enable Markdown Preview + GitHub flavored markdown
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'nelstrom/vim-markdown-preview'

" Make Ctrl+w o, function with toggle niceness
Plugin 'vim-scripts/ZoomWin'

" pep8 indentation
Plugin 'hynek/vim-python-pep8-indent'

" highlight trailing white
Plugin 'bronson/vim-trailing-whitespace'

" coffee support
Plugin 'kchmck/vim-coffee-script'

" python virtualenv support
Plugin 'jmcantrell/vim-virtualenv'

" Clojure support
Plugin 'guns/vim-clojure-static'

" END OF VUNDLE PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set hlsearch
" Makes search act like search in modern browsers
set incsearch
set invnumber

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:Ã‚Â·

set wrap       "Wrap lines
set linebreak  "Wrap lines at convenient points

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=*.pyc
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set shortmess=atI

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
map <leader>q :bd<cr>
map <leader>w :w<cr>
map <leader>y :w !pbcopy<cr><cr>
map <leader>ve :tabe ~/Code/dotfiles/vimrc<cr>
map <leader>vc :tabe ~/.cloudmonkey/config<cr>
map <leader>vt :tabe ~/.tmux.conf<cr>
" File explorer
map <leader>e :Ex<cr>

" Git mappings
map <leader>ga :Git add -p<cr>
map <leader>gw :Gwrite<cr>
map <leader>gb :Git checkout -b<space>
map <leader>gp :Git pull<cr>
map <leader>gd :Git diff<cr>
map <leader>gs :Git status<cr>
map <leader>gf :Git fetch<cr>
map <leader>gc :Gcommit<cr>
map <leader>pr :!stash pr create<space>

" Paste mode
map <leader>pp :setlocal paste!<cr>
" Quickly switch between tabstop
map <leader>2 :set tabstop=2 shiftwidth=2<cr>
map <leader>4 :set tabstop=4 shiftwidth=4<cr>

" Toggle line number
map <Leader>i <esc>:set invnumber<cr>

" CWD to select file dir
nmap <Leader>cd :lcd %:p:h<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Smart win resize
map <C-W><C-j> <C-W>3+
map <C-W><C-k> <C-W>3-
map <C-W><C-h> <C-W>10<
map <C-W><C-l> <C-W>10>

" Color theme (drawing from altercation/vim-colors-solarized Bundle)
syntax enable
set background=dark
colorscheme solarized
color solarized

" Use 2-space indent for this filetypes
autocmd FileType html,css,scss,jade,ruby,yaml,json,coffee setlocal shiftwidth=2
autocmd FileType html,css,scss,jade,ruby,yaml,json,coffee setlocal tabstop=2
autocmd FileType html,css,scss,jade,ruby,yaml,json,coffee setlocal softtabstop=2

" For MacVim
if has("gui_running")
    set guifont=Sauce\ Code\ Powerline:h16
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" ===== SYNTASTIC
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}
"Python
let g:syntastic_python_checkers = ['python', 'pylint']

" Airline stuff
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
set noshowmode
" Support for github flavored markdown
" via https://github.com/jtratner/vim-flavored-markdown
" with .md extensions
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
