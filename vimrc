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

set wrap                          " Turn on line wrapping.
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

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P


"
" CTRL + x CTRL + o brings up code completion for functions.
"

" Or use vividchalk
"colorscheme topfunky-lightA  AQQQ
colorscheme twilight
"colorscheme IR_Black

" Tab mappings.
"map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Uncomment to use Jamis Buck's file opening plugin
noremap <silent> <c-a> :NERDTreeToggle<Enter>
noremap <silent> <c-t> :FuzzyFinderTextMate<Enter>
map <Leader>f :FuzzyFinderTextMate<Enter>
map <Leader>d :FufDir<Enter>
"map <Leader>t :ConqueTerm zsh -l<Enter>
map <Leader>t :TlistToggle<Enter>
map <Leader>r :MRU<Enter>
noremap <silent> <c-l> :nohls<CR><c-l>
map <Leader>t> :Align =><Enter>


" Rainbows!
nmap <leader>R :RainbowParenthesesToggle<CR>

" Quick switch syntax
" com! Html set ft=html
" com! Php  set ft=php
com! Html set ft=html<ENTER>set syntax=php
com! Php  set ft=php<ENTER>set syntax=php

map <Leader>h :set ft=html syntax=php<ENTER>
map <Leader>p :set ft=php syntax=php<ENTER>

" Press F9 to open/close folds
inoremap <silent> <F9> <C-O>za
nnoremap <silent> <F9> za
onoremap <silent> <F9> <C-C>za
vnoremap <silent> <F9> zf

" Press F10 open all folds
nnoremap <silent> <F10> zR
" Press F10 close all folds
nnoremap <silent> <F11> zM

" Refreshes ctrl + t file search
map <special> <F12> :ruby finder.rescan!<ENTER>

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

inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>


nmap <Down> <c-Down>
" Make it so you can't use arrows
" nmap <Left>     <Esc>:echo "You should have typed h instead"<CR>
" nmap <Right>    <Esc>:echo "You should have typed l instead"<CR>
" nmap <Up>       <Esc>:echo "You should have typed k instead"<CR>
" nmap <Down>     <Esc>:echo "You should have typed j instead"<CR>

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
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

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
  set history=1000  				" Store a ton of history (default is 20)
  "set spell 		 	        	" spell checking on

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

" PIV {
  let g:DisableAutoPHPFolding = 0
" }
" Firstly, disable the netrw plugin
let g:NERDTreeHijackNetrw = 0
let g:loaded_netrw       = 1 " Disable netrw
let g:loaded_netrwPlugin = 1 " Disable netrw

" Next, add this to your .vimrc
au VimEnter * :NERDTreeToggle
au VimEnter * :wincmd p
au VimEnter * :set wrap

map <Leader>w :set wrap<Enter>
" Compile coffee files on save
au BufWrite *.coffee !coffee -c %:p
" Always open files in \"Edit Anyway\"
set shortmess+=A
