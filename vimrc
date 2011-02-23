" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set autoread                      " Automatically reads the file again"
set autowrite                     " Automatically write dity buffers on close

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

" set wrap linebreak nolist                          " Turn on line wrapping.
set wrap nolist                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set list listchars=tab:\ \ ,trail:·
"set noai                        " stop copying tabs

" fix tabs
map <F2> :set expandtab <CR> :retab <CR>

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P


"
" CTRL + x CTRL + o brings up code completion for functions.
"

" Or use vividchalk
"colorscheme topfunky-lightA  AQQQ
colorscheme twilight
" GRB: set the color scheme
" if has("gui_running")
"     :color twilight
" else
"     :color grb4
" endif
"colorscheme IR_Black

" Tab mappings.
" map <leader>tn :tabnew<cr>
set t_Co=256
map <leader>to :tabnew<cr>
" map <leader>te :tabedit
map <leader>tc :tabclose<cr>
" map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
" map <leader>tf :tabfirst<cr>
" map <leader>tl :tablast<cr>
" map <leader>tm :tabmove
map <C-Left> :tabprevious<cr>
map <C-Right> :tabnext<cr>
nmap <C-Left> :tabprevious<cr>
nmap <C-Right> :tabnext<cr>
vmap <C-Left> :tabprevious<cr>
vmap <C-Right> :tabnext<cr>

" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" Uncomment to use Jamis Buck's file opening plugin
noremap <silent> <c-a> :NERDTreeToggle<Enter>
noremap <silent> <c-t> :FuzzyFinderTextMate<Enter>
"map <Leader>f :FuzzyFinderTextMate<Enter>
map <Leader>d :FufDir<Enter>
"map <Leader>t :ConqueTerm zsh -l<Enter>
map <Leader>f :TlistToggle<Enter>
map <Leader>r :MRU<Enter>

" toggle spelling on and off
imap <Leader>s <C-o>:setlocal spell! spelllang=en_us<CR>
nmap <Leader>s :setlocal spell! spelllang=en_us<CR>

map <Leader>t> :Align =><Enter>
noremap <silent> <c-l> :nohls<CR><c-l>


" Rainbows!
nmap <leader>R :RainbowParenthesesToggle<CR>

" Quick switch syntax
" com! Html set ft=html
" com! Php  set ft=php
com! Html set ft=html<ENTER>set syntax=php
com! Php  set ft=php<ENTER>set syntax=php

map <Leader>h :set ft=html syntax=php<ENTER>
map <Leader>p :set ft=php syntax=php<ENTER>
map <Leader>a :setf apache<ENTER>

" Press F9 to open/close folds
inoremap <silent> <F9> <C-O>za
nnoremap <silent> <F9> za
onoremap <silent> <F9> <C-C>za
vnoremap <silent> <F9> zf

" Press F10 open all folds
nnoremap <silent> <F10> zR
" Press F10 close all folds
nnoremap <silent> <F11> zM

map <F8> <Esc>:EnableFastPHPFolds<Cr>
" Refreshes ctrl + t file search with f+12 and on new file creation
map <special> <F12> :ruby finder.rescan!<ENTER>
au BufNewFile :ruby finder.rescan!<ENTER>

set undofile
" set undodir .

" CoffeScript
" Disable error for spacing
let coffee_no_trailing_space_error = 1

set history=50 " keep track of last commands

" enable visible whitespace
set listchars=tab:»·,trail:·,precedes:<,extends:>
set list

"
" Enable spellchecking conditionally
"
map <Leader>se :setlocal spell spelllang=en_us<CR>
map <Leader>sn :setlocal nospell<CR>

"
" Configure Neocomplcache
"
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_smart_case = 1
" " let g:NeoComplCache_EnableCamelCaseCompletion = 1
" let g:neocomplcache_enable_underbar_completion = 1
" let g:neocomplcache_min_syntax_length = 2
" let g:neocomplcache_enable_auto_select = 1

let g:tlist_php_settings = 'php;c:class;f:function'
let Tlist_Show_One_File = 1

inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>


" nmap <Down> <c-Down>
" Make it so you can't use arrows
" nmap <Left>     <Esc>:echo "You should have typed h instead"<CR>
" nmap <Right>    <Esc>:echo "You should have typed l instead"<CR>
" nmap <Up>       <Esc>:echo "You should have typed k instead"<CR>
" nmap <Down>     <Esc>:echo "You should have typed j instead"<CR>

nmap <Up> g<Up>
nmap <Down> g<Down>

" Auto move wrapped lines
map k gk
map j gj

" make tab in visual mode indent code
vmap <tab> >gv
vmap <s-tab> <gv

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css setlocal foldmethod=indent

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec
"
"  " Delimitmate {
" au FileType * let b:delimitMate_autoclose = 1
"
" " If using html auto complete (complete closing tag)
au FileType xml,html,xhtml let b:AutoClosePairs = {'<': '>', '?': '?', '(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}
" " }
"
" " AutoCloseTag {
" " Make it so AutoCloseTag works for xml and xhtml files as well
" au FileType xhtml,xml,php ru ftplugin/html/autoclosetag.vim
" " }
"
" au FileType php set omnifunc=phpcomplete#CompletePHP

" Supertab {
  "let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" }
  set history=1000          " Store a ton of history (default is 20)
  "set spell                " spell checking on

    " SnipMate {
    " Setting the author var
    let g:snips_author = 'Steve Francia <steve.francia@gmail.com>'
    " Shortcut for reloading snippets, useful when developing
    nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
  " }
  " For when you forget to sudo.. Really Write the file.
  cmap w!! w !sudo tee % >/dev/null
" }
"
let g:SuperTabMappingForward = "<leader><space>"

"""
" SEE WHAT FILE IS SETTING cmdheight
"""
":verbose set cmdheight?

" Firstly, disable the netrw plugin
let g:NERDTreeHijackNetrw = 0
let g:loaded_netrw       = 1 " Disable netrw
let g:loaded_netrwPlugin = 1 " Disable netrw

" Next, add this to your .vimrc
" au VimEnter * :NERDTreeToggle
" au VimEnter * :wincmd p
" " au VimEnter * :set wrap linebreak nolist
" au VimEnter * :set wrap nolist

" map <Leader>w :set wrap linebreak nolist<Enter>
map <Leader>w :set wrap nolist<Enter>
" Compile coffee files on save
au BufWrite *.coffee !coffee -c %:p
" Always open files in \"Edit Anyway\"
set shortmess+=A

" Auto copies Gists to clipboard
let g:gist_clip_command = 'pbcopy'

" Detect FileType from FileName
let g:gist_detect_filetype = 1

" let php_sql_query=1 " to highlight SQL syntax in strings
" let php_htmlInStrings=1 " to highlight HTML in string

" Press ,v to edit vimrc
map <leader>ev :tabedit $MYVIMRC<CR>
" TODO list
map <Leader>t :tabedit $HOME/.vim/TODO.taskpaper<ENTER>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Source the vimrc file after saving it
au BufWrite .vimrc source $MYVIMRC

let g:pdv_cfg_Author = "CJ Lazell <cjlazell@gmail.com>"

" Always retab and make sure we're using spaces and not tabs
au BufWritePre * set et | retab

" au BufWriteCmd *.html,*.css,*.gtpl,*/views/**.php,*.coffee :call Refresh_firefox()
" function! Refresh_firefox()
" if &modified
"     write
"     silent !echo  'vimYo = content.window.pageYOffset;
"                  \\ vimXo = content.window.pageXOffset;
"                  \\ BrowserReload();
"                  \\ content.window.scrollTo(vimXo,vimYo);
"                  \\ repl.quit();'  |
"                  \\ nc localhost 4242 2>&1 > /dev/null
"   endif
" endfunction

function! Refresh_firefox_force()
  write
  silent !echo  'vimYo = content.window.pageYOffset;
               \ vimXo = content.window.pageXOffset;
               \ BrowserReload();
               \ content.window.scrollTo(vimXo,vimYo);
               \ repl.quit();'  |
               \ nc localhost 4242 2>&1 > /dev/null
endfunction

map <C-r> :call Refresh_firefox_force()<CR>

" json syntax highlighting
au! BufRead,BufNewFile *.json setfiletype json
" .ejs support
au BufNewFile,BufRead *.ejs set ft=html syntax=php
au BufNewFile,BufRead */views/**.php set ft=html syntax=php
autocmd BufRead,BufNewFile *.js set ft=javascript syntax=jquery

" Tab completion
set wildmode=list:longest,list:full
" Ignore certain files on complete
set wildignore+=.git

" Ignore .gitignore files
let filename = '.gitignore'
if filereadable(filename)
    let igstring = ''
    for oline in readfile(filename)
        let line = substitute(oline, '\s|\n|\r', '', "g")
        if line =~ '^#' | con | endif
        if line == '' | con  | endif
        if line =~ '^!' | con  | endif
        if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
        let igstring .= "," . line
    endfor
    let execstring = "set wildignore+=".substitute(igstring, '^,', '', "g")
    execute execstring
endif

" Zoom/focus into window
map <C-z> :ZoomWin<cr>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-]> <CR> g<C-]><CR>

command! Trail :%s/\s\+$//g
au BufRead,BufNewFile *.txt call s:setupWrapping()

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" set Cmd-# and Alt-# to switch windows
for n in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let k = n == "0" ? "10" : n
    for m in ["A", "D"]
        exec printf("imap <silent> <%s-%s> <Esc><%s-%s>a", m, n, m, n)
        exec printf("nmap <silent> <%s-%s> :%swincmd w<CR>", m, n, k)
    endfor
endfor
