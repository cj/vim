" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=Inconsolata-dz:h15       " Font family and font size.
"set guifont=Monaco:h15            " Font family and font size.
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
"set background=light             " Background.
set background=dark
set lines=40 columns=100          " Window dimensions.
set ch=3                         " Stops vim asking you to continue every time

"set guioptions-=r                " Don't show right scrollbar

" PHP Specific options. Yay!
" autocmd FileType php let php_sql_query=1
" autocmd FileType php let php_htmlInStrings=1
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType c set omnifunc=ccomplete#Complete
" map <C-h>  : tabprevious<cr>
" map <C-l>  : tabnext<cr>
" nmap <C-h> : tabprevious<cr>
" nmap <C-l> : tabnext<cr>
" vmap <C-h> : tabprevious<cr>
" vmap <C-l> : tabnext<cr>
