lua require("init")

set title
set titlestring=%F%m\ %r\ %y

function s:recompile_plugins()
  luafile %
  PackerCompile
endfunction

"" Autocommands

augroup recompile_plugins
  autocmd!
  autocmd BufWritePost plugins.lua call <SID>recompile_plugins()
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.hcl set filetype=terraform
autocmd BufRead,BufNewFile *.tf set filetype=terraform

"" Temporary hacks

" Show syntax highlight group in the status bar
map ,H :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map ,L :luafile %<CR>
