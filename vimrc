"""""""""""""""""""""""""
" General configuration "
"""""""""""""""""""""""""

" General config ---------------------- {{{
 
" be iMproved
set nocompatible
" Use 256 colors
set t_Co=256
" Always show what mode I'm currently editing in
set showmode
" Always show line numbers
set number
" Don't beep
set visualbell
" Don't beep
set noerrorbells
" No swap or backup files
set noswapfile
set nobackup
set nowb
" Detect '_' char as word delimiter
" set iskeyword-=_
" Show (partial) command in the status line
set showcmd
" set the commandheight
set cmdheight=2

colo xoria256

" Let Gstatus split vertically instead of horizontally
set diffopt+=vertical

" }}}


""""""""""""""""
" Autocommands "
""""""""""""""""

" Filetype recognition ---------------------- {{{
 
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.scss set filetype=sass

" }}}

" Vimscript ---------------------- {{{
"
augroup filetype_vim
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" PHP ---------------------- {{{
augroup filetype_php
    autocmd!
    autocmd FileType php :iabbrev pubf public function
    autocmd FileType php :iabbrev prif private function
    autocmd FileType php :iabbrev prof protected function
    autocmd FileType php :iabbrev func function
augroup END

" }}}

" Markdown ---------------------- {{{
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown :onoremap ah :<c-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" Behat ---------------------- {{{
augroup filetype_behat
    autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END
" }}}


""""""""""
" Vundle "
""""""""""

" Config ---------------------- {{{
 
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

filetype plugin indent on

" }}}

" Plugins ---------------------- {{{

call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'


Plugin 'colorsupport'

Plugin 'scrooloose/nerdtree'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'StanAngeloff/php.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'xsbeats/vim-blade'
Plugin 'uguu-org/vim-matrix-screensaver' 
Plugin 'othree/html5.vim'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'vim-php/vim-php-refactoring'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'majutsushi/tagbar'

" For SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'joonty/vim-phpunitqf.git'

call vundle#end()

" }}}


"""""""
" TAB "
"""""""

" {{{

" Spaces instead of tabs
set expandtab
" I like 4 spaces for indenting
set shiftwidth=4
" I like 4 stops
set tabstop=4
" Always  set auto indenting on
set autoindent
" Copy the previous indentation on autoindenting
set copyindent
" Use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" When hitting <BS>, pretend like a tab is removed
set softtabstop=4
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" }}}


""""""""""
" Search "
""""""""""

" {{{

" Ignore case when searching
set ignorecase
" Ignore case if search pattern is all lowecase
set smartcase
" Highlight a term when searching for it
set hlsearch 

" }}}


""""""""""""
" Mappings "
""""""""""""

" Leaders mappings ---------------------- {{{

let mapleader = ","
let localleader = "\\"

" Easy editing and sourcing .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Fast saves and quits
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>x :wq<cr>
nnoremap <leader>a :q!<cr>

" Remove search results
nnoremap <leader>h :let @/=""<cr>

" Wraps the current word into single/double quotes
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel


" }}}

" Normal mode mappings ---------------------- {{{

" Turn ; into : in normal mode, for convenience
nnoremap ; :

" Make space bar more useful
nnoremap <space> viw

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Move to the begining of the current line
nnoremap H ^
" Move to the end of the current line
nnoremap L $

" Move a line below
nnoremap J ddp
" Move a line above
nnoremap K ddkP

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}

" Insert mode mappings ---------------------- {{{

" Remove a line
inoremap <c-d> <esc>ddi
" Convert current word to uppercase
inoremap <c-u> <esc>viwUea

" Upper-caser 3000
inoremap <c-u> <esc>viwUea
" Remove a line
inoremap <c-d> <esc>ddO

" PHP namespaces
inoremap <leader>u <C-O>:call PhpInsertUse()<CR>
noremap <leader>u :call PhpInsertUse()<CR>

" }}}

" Visual mode mappings ---------------------- {{{

" Suround word with quotes
vnoremap ' b<esc>i'<esc>lea'
vnoremap " b<esc>i"<esc>lea"

" Wraps currently selected text into single/double quotes
vnoremap ' <esc>`>a'<esc>`<i'<esc>`>l
vnoremap " <esc>`>a"<esc>`<i"<esc>`>l

" }}}

" Operator-pending mappings ---------------------- {{{

" Map 'inside parens' to p
onoremap p i(
" Until the end of a function's body
onoremap b /return<cr>
" Inside next parens
onoremap in( :<c-u>normal! f(vi(<cr>
" Inside last parens
onoremap il( :<c-u>normal! F)vi(<cr>
" Inside next brackets
onoremap in[ :<c-u>normal! f[vi[<cr>
" Inside last brackets
onoremap il[ :<c-u>normal! F]vi[<cr>
" Inside next curly brackets
onoremap in{ :<c-u>normal! f{vi{<cr>
" Inside last culy brackets
onoremap il{ :<c-u>normal! F}vi{<cr>
" Around next parens
onoremap an( :<c-u>normal! f(va(<cr>
" Around last parens
onoremap al( :<c-u>normal! F)va(<cr>
" Around next brackets
onoremap an[ :<c-u>normal! f[va[<cr>
" Around last brackets
onoremap al[ :<c-u>normal! F]va[<cr>
" Around next curly brackets
onoremap an{ :<c-u>normal! f{va{<cr>
" Around last culy brackets
onoremap al{ :<c-u>normal! F}va{<cr>

" }}}
 
" Plugin-specific mappings ---------------------- {{{

" NERDTree
nnoremap <c-b> :NERDTreeToggle<cr>
" Tagbar
nnoremap <silent> <leader>z :TagbarToggle<cr>

" Run tests
nnoremap <leader>m :Test<cr>
" PHP namespaces
inoremap <leader>u <C-O>:call PhpInsertUse()<CR>
noremap <leader>u :call PhpInsertUse()<CR>
inoremap <leader>ex <C-O>:call PhpExpandClass()<CR>
nnoremap <leader>ex :call PhpExpandClass()<CR>

" }}}


"""""""""""""""""
" Abbreviations "
"""""""""""""""""

" {{{

abbrev amm !php artisan make:model
abbrev amc !php artisan make:controller
abbrev amg !php artisan make:migration
iabbrev funciton function
iabbrev calss class

"}}}


"""""""""
" CtrlP "
"""""""""

" {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .git
    \ --ignore vendor
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ -g ""'

"}}}


"""""""""""
" Airline "
"""""""""""

" {{{

let g:airline#extensions#tabline#enabled = 1

" Always show the status line
set laststatus=2
" For unicode glyphs
set encoding=utf-8
set fileencoding=utf-8
" Hide the default mode text
set noshowmode

let g:airline_theme='jellybeans'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" }}}


""""""""""""""""""
" PHP Refactor   "
""""""""""""""""""

let g:php_refactor_command='php /usr/local/bin/refactor'


""""""""""""""""""
" PHP generators "
""""""""""""""""""

" {{{

" Prepare a new PHP class
function! Class()
  let name = input('Class Name? ')
  let namespace = input('Any Namespace? ')

  if strlen(namespace)
    exec "normal i<?php namespace " . namespace . ";\<C-m>\<C-m>"
  else
    exec "normal i<?php\<C-m>\<C-m>"
  endif

  " Open class
  exec "normal iclass " . name . " {\<C-m>}\<C-[>O\<C-[>"

  exec "normal i\<C-m>    public function __construct()\<C-m>{\<C-m>\<C-m>}\<C-[>"
endfunction

" Prepare a new PHP class extension
function! ClassExtension()
  let name = input('Class Name? ')
  let extends = input('Extends...? ')
  let namespace = input('Any Namespace? ')

  if strlen(namespace)
    exec "normal i<?php namespace " . namespace . ";\<C-m>\<C-m>"
  else
    exec "normal i<?php\<C-m>\<C-m>"
  endif

  " Open class
  exec "normal iclass " . name . " extends " . extends . " {\<C-m>}\<C-[>O\<C-[>"

  exec "normal i\<C-m>    public function __construct()\<C-m>{\<C-m>\<C-m>}\<C-[>"
endfunction

" Prepare a new PHP interface
function! Interface()
  let name = input('Interface Name? ')
  let namespace = input('Any Namespace? ')

  if strlen(namespace)
    exec "normal i<?php namespace " . namespace . ";\<C-m>\<C-m>"
  else
    exec "normal i<?php\<C-m>\<C-m>"
  endif

  " Open class
  exec "normal iinterface " . name " {\<C-m>}\<C-[>O\<C-[>"

  exec "normal i\<C-m>    public function __construct()\<C-m>{\<C-m>\<C-m>}\<C-[>"
endfunction

" Prepare a new PHP interface extension
function! InterfaceExtension()
  let name = input('Interface Name? ')
  let extends = input('Extends...? ')
  let namespace = input('Any Namespace? ')

  if strlen(namespace)
    exec "normal i<?php namespace " . namespace . ";\<C-m>\<C-m>"
  else
    exec "normal i<?php\<C-m>\<C-m>"
  endif

  " Open class
  exec "normal iinterface " . name . " extends " . extends . " {\<C-m>}\<C-[>O\<C-[>"

  exec "normal i\<C-m>    public function __construct()\<C-m>{\<C-m>\<C-m>}\<C-[>"
endfunction

" Prepare a new PHP implementation
function! InterfaceImplementation()
  let name = input('Class Name? ')
  let implements = input('Implements...? ')
  let namespace = input('Any Namespace? ')

  if strlen(namespace)
    exec "normal i<?php namespace " . namespace . ";\<C-m>\<C-m>"
  else
    exec "normal i<?php\<C-m>\<C-m>"
  endif

  " Open class
  exec "normal iclass " . name . " implements " . implements . " {\<C-m>}\<C-[>O\<C-[>"

  exec "normal i\<C-m>    public function __construct()\<C-m>{\<C-m>\<C-m>}\<C-[>"
endfunction

nmap ,1 :call Class()<cr>
nmap ,2 :call ClassExtension()<cr>
nmap ,3 :call Interface()<cr>
nmap ,4 :call InterfaceExtension()<cr>
nmap ,5 :call InterfaceImplementation()<cr>

" }}}

