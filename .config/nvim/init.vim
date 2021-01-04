call plug#begin('~/.vim/plugged')
" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter'

"Colors
Plug 'tjdevries/colorbuddy.vim'
Plug '~/src/github.com/shelmangroup/nvim-shelman-theme'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Rego
Plug 'tsandall/vim-rego'

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
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Golang
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'

" Rust
Plug 'rust-lang/rust.vim'

" Terraform
Plug 'b4b4r07/vim-hcl'
Plug 'hashivim/vim-terraform'

" Jsonnet filetype plugin
Plug 'google/vim-jsonnet'

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
set noshowmode
set noruler
set laststatus=0

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
set hidden
set title
set titlestring=%F%m\ %r\ %y
"turn on syntax highlightingk
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
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set nojoinspaces

filetype plugin on
filetype indent on

set nowrap       "NoWrap lines
set tw=79
set colorcolumn=80
set fo-=t

" Completion
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

"" syntax and completion
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

:lua << END
require'lspconfig'.gopls.setup{
}

require'lspconfig'.terraformls.setup{
  cmd = {'terraform-ls', 'serve'}
}

require'lspconfig'.vimls.setup{
}

require'lspconfig'.yamlls.setup{
}

END

nmap <tab> <Plug>(completion_smart_tab)
nmap <s-tab> <Plug>(completion_smart_s_tab)
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"" Diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 1
let g:diagnostic_virtual_text_prefix = '⟸ '

call sign_define("LspDiagnosticsErrorSign", {"text" : "🔥", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "⚠", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "I", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "H", "texthl" : "LspDiagnosticsHint"})

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
set completeopt=menuone,noinsert,noselect
set shortmess+=c

autocmd BufEnter * lua require'completion'.on_attach()

"" Treesitter
:lua << END
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}
END
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" tags
set tags=./tags;/

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
let g:go_auto_sameids = 1
" let g:go_auto_type_info = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 0

" Support for github flavored markdown
" via https://github.com/jtratner/vim-flavored-markdown
" with .md extensions
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"" Jsonnet
let g:jsonnet_fmt_fail_silently = 0
autocmd BufNewFile,BufAdd,BufRead *.libjsonnet setlocal ft=jsonnet

" Color theme
set background=dark
lua require('colorbuddy').colorscheme('shelman-dark')

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" " undercurl in tmux
set t_Cs = "\e[4:3m"
set t_Ce = "\e[4:0m"
