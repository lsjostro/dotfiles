call plug#begin('~/.vim/plugged')
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Markdown
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

" Toml
Plug 'cespare/vim-toml'

" remove trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" comment lines out (gc in visual mode)
Plug 'tomtom/tcomment_vim'

" Pimped out bar at the bottom of current buffer
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Golang
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'

" Rust
Plug 'rust-lang/rust.vim'

" Terraform
Plug 'hashivim/vim-terraform'
Plug 'b4b4r07/vim-hcl'

" Jsonnet filetype plugin
Plug 'google/vim-jsonnet'

" Ale
" Plug 'w0rp/ale'
"
Plug 'kristijanhusak/vim-hybrid-material'

"Powershell syntax highlight
Plug 'PProvost/vim-ps1'

" Initialize plugin system
call plug#end()
filetype plugin indent on     " required!

" ================ General Config ====================
"language en_US
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
" set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set noerrorbells
set ruler
set cursorline
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
set autochdir
set nofoldenable                " disable folding
set autoread                    "Reload files changed outside vim
set hlsearch
" Makes search act like search in modern browsers
set incsearch
set number
set mouse=a
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Nvim python runtime environment
" let g:python3_host_prog = "/usr/local/bin/python3"
" let g:python_host_prog = "/usr/local/bin/python2"

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
set nojoinspaces

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
set completeopt=noinsert,menuone,noselect

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set shortmess=atI

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

"set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=1000
" don't give |ins-completion-menu| messages.
set shortmess+=c



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
" map <leader>e :Ex<cr>

" Git mappings
" map <leader>ga :Git add -p<cr>
" map <leader>gw :Gwrite<cr>
" map <leader>gb :Git checkout -b<space>
" map <leader>gp :Git pull<cr>
" map <leader>gd :Git diff<cr>
" map <leader>gs :Git status<cr>
" map <leader>gf :Git fetch<cr>
" map <leader>gc :Gcommit<cr>
" map <leader>pr :!stash pr create<space>

" FZF
map <silent> <space> :Buffers<cr>
map <silent> <leader>` :Buffers<cr>
map <silent> <leader>; :Commits<cr>
map <silent> <leader>e :GitFiles<cr>
map <silent> <leader>d :Files<cr>
map <silent> <leader>f :History<cr>
" map <silent> <leader>g :BLines<cr>
map <silent> <leader>m :Marks<cr>
map <silent> <leader>/ :RG<cr>

"" fzf
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 20])])
    " let top = ((&lines - height) / 2) - 1
    let top = 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "┌" . repeat("─", width - 2) . "┐"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "└" . repeat("─", width - 2) . "┘"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command], 'window': { 'width': 0.9, 'height': 0.6 }}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

let g:fzf_layout = { 'up': '~40%', 'window': 'call CreateCenteredFloatingWindow()' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Comment'],
  \ 'bg':      ['bg', 'Comment'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'PMenuSel', 'PMenuSel', 'Normal'],
  \ 'bg+':     ['bg', 'PMenuSel', 'PMenuSel'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Normal'] }


"Ale
" let g:airline#extensions#ale#enabled = 1
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = ''      "       ﱥ   ﬡ  樂
" let g:ale_sign_warning = ''
" let g:ale_linters = {'go': ['gofmt']}
" let g:ale_linters = {'go': ['go build', 'gofmt', 'golint', 'gometalinter', 'gosimple', 'go vet', 'staticcheck']}
" let g:ale_linters = {'go': ['gofmt', 'golint', 'gometalinter', 'gosimple', 'go vet', 'staticcheck']}
" let g:ale_linters = {'go': ['gofmt', 'gometalinter']}
" let g:go_gometalinter_options = join([
"  \    '--fast'
"  \ ], ' ')
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Disable F1 help
nmap <F1> <nop>

" Paste mode
map <leader>pp :setlocal paste!<cr>

" X clipboard copy
vmap <silent> ,y :!wl-copy<cr>
" X clipboard paste
map <silent> ,v :-1r !wl-paste<cr>

" Quickly switch between tabstop
map <leader>2 :set tabstop=2 shiftwidth=2<cr>
map <leader>4 :set tabstop=4 shiftwidth=4<cr>

" Toggle line number
" map <Leader>i <esc>:set invnumber<cr>

" CWD to select file dir
nmap <Leader>cd :lcd %:p:h<cr>

"" "Turn off search highlight
map <silent> <leader><cr> :noh<cr>

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

"" COC completion

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd CursorHold * silent call CocActionAsync('doHover')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" vmap <leader>fr  <Plug>(coc-format-selected)
" nmap <leader>fr  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>af  <Plug>(coc-fix-current)

" tags
set tags=./tags;/

" Color theme (drawing from altercation/vim-colors-solarized Bundle)
syntax enable
set background=dark
colorscheme hybrid_material
let g:enable_bold_font = 1
let g:enable_italic_font = 1
" colorscheme NeoSolarized
" let g:neosolarized_italic=1
highlight Comment gui=italic cterm=italic
highlight htmlArg gui=italic cterm=italic
highlight String guifg=#2aa198 gui=italic

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

" Git

let g:SCMDiffCommand = "git"
let VCSCommandDeleteOnHide = 1
let g:git_branch_status_nogit=""
let g:git_branch_status_around="[]"
let g:git_branch_status_text=""
let g:git_branch_status_head_current=1
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''

" Golang
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" let g:go_auto_sameids = 1
let g:go_auto_type_info = 0
let g:go_def_mapping_enabled = 0
" let g:go_info_mode = 'guru'
"let g:go_updatetime = 20
"
" autocmd FileType go nmap <Leader>i <Plug>(go-info)
" autocmd FileType go nmap <S-k> <Plug>(go-doc)
" autocmd FileType go nmap <Leader>d <Plug>(go-doc-vertical)

" Airline stuff
" set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline_theme='solarized'
let g:airline_theme='hybrid'
hi MsgArea guifg=#e65100
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_x = ''   " Hide file type
let g:airline_section_z = "\uf0c9 %l \u2162 %c"
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'c'  : 'C',
      \ 'i'  : 'I',
      \ 'ic' : 'I',
      \ 'ix' : 'I',
      \ 'n'  : "\ue62b",
      \ 'ni' : "\ue62b",
      \ 'no' : "\ue62b",
      \ 'R'  : 'R',
      \ 'Rv' : 'R',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ 't'  : 'T',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ }

let s:hidden_all = 1
set noshowmode
set noruler
set laststatus=0
set noshowcmd

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <S-h> :call ToggleHiddenAll()<CR>

" Support for github flavored markdown
" via https://github.com/jtratner/vim-flavored-markdown
" with .md extensions
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Use 2-space indent for this filetypes
autocmd FileType html,css,scss,jade,ruby,yaml,json,coffee setlocal shiftwidth=2
autocmd FileType html,css,scss,jade,ruby,yaml,json,coffee setlocal tabstop=2
autocmd FileType html,css,scss,jade,ruby,yaml,json,coffee setlocal softtabstop=2

"" Jsonnet
let g:jsonnet_fmt_fail_silently = 0
autocmd BufNewFile,BufAdd,BufRead *.libjsonnet setlocal ft=jsonnet
