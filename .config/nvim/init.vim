call plug#begin('~/.vim/plugged')
" Autocomplete
Plug 'roxma/nvim-completion-manager'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Markdown
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'


" remove trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" comment lines out (gc in visual mode)
Plug 'tomtom/tcomment_vim'

" Pimped out bar at the bottom of current buffer
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Golang
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'roxma/nvim-cm-racer'

" Terraform
Plug 'hashivim/vim-terraform'
Plug 'b4b4r07/vim-hcl'

" Jsonnet filetype plugin
Plug 'google/vim-jsonnet'

" Initialize plugin system
call plug#end()
filetype plugin indent on     " required!

" ================ General Config ====================
language en_US
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

if has("nvim")
  set termguicolors
endif

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

set nowrap       "NoWrap lines
" set linebreak  "Wrap lines at convenient points
set tw=79
set colorcolumn=80
set fo-=t

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

imap § <Esc>

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
map <leader>q :bd<cr>
map <leader>w :w<cr>
map <leader>y :w !pbcopy<cr><cr>
map <leader>ve :e ~/.config/nvim/init.vim<cr>

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

" FZF
map <silent> <space> :Buffers<cr>
map <silent> ,` :Buffers<cr>
map <silent> ,; :Commits<cr>
map <silent> ,e :GitFiles<cr>
map <silent> ,d :Files<cr>
map <silent> ,f :History<cr>
map <silent> ,g :BLines<cr>
map <silent> ,/ :Ag<cr>
map <silent> ,m :Marks<cr>

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
let g:neosolarized_italic=1
syntax enable
set background=dark
colorscheme NeoSolarized
highlight Comment cterm=italic
" color solarized
" let g:solarized_termcolors=256

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

" enable autocomplete
let g:deoplete#enable_at_startup = 1

" Git
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = '◊'
let g:gitgutter_sign_modified = '▲'
let g:gitgutter_sign_removed = '◊'
let g:gitgutter_sign_removed_first_line = '◊'
let g:gitgutter_sign_modified_removed = '◊'
" Golang
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" let g:go_auto_sameids = 1
let g:go_auto_type_info = 0
" let g:go_def_mapping_enabled = 0
let g:go_info_mode = 'guru'
"let g:go_updatetime = 20
"
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <S-k> <Plug>(go-doc)
autocmd FileType go nmap <Leader>d <Plug>(go-doc-vertical)

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

