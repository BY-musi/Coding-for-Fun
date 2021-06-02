""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=300

" Sets line number
set nu " show row number
set relativenumber " relative row number

set wrap

" cursor
set cursorline " highlight line cursor
"set cursorcolumn " highlight column cursor

" different cursor shape in different mode
"let &t_SI = "\<ESC>50;CursorShape=1\x7"
"let &t_SR = "\<ESC>50;CursorShape=2\x7"
"let &t_EI = "\<ESC>50;CursorShape=0\x7"

" 允许使用鼠标
set mouse=a

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","

" Move quickly
nnoremap J 6j
nnoremap K 5k

set smarttab " Be smart when using tabs
set expandtab " Convent Tab to space

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai " Auto indent
set si " Smart indent

" auto complete
"inoremap {<CR> {<CR>}<ESC>O
"inoremap ( ()<ESC>i
"inoremap { {}<ESC>i
"inoremap [ []<ESC>i
"inoremap ' ''<ESC>i
"inoremap <leader><leader> <ESC>A

" enable yank and copy from vim to system, host
vnoremap <leader>y "+y
nmap <leader>p "+p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => run and debug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :w<CR>:call Run()<CR>
imap <F5> <ESC>:w<CR>:call Run()<CR>

func! Run()
    if &filetype == 'c'
        exec "!g++ % -o %< && ./%<"
        exec "redraw!"
        echohl WarningMsg | echo " Running finish! :-)"

    elseif &filetype == 'python'
        exec "!python %"
        redraw!
        echohl WarningMsg | echo " Running finish! :-)"

    elseif &filetype == 'sh'
        :!./%
        echohl WarningMsg | echo " Running finish! :-)"

    else
        redraw!
        echo "Language not support! :-("
    endif
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" MarkDown """""""""""
let g:vim_markdown_path = 1

"""""""" Rainbow """"""""""""
let g:rainbow_conf = {
\	'guifgs': ['#C186BF', '#268EDB','#F79318'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}
let g:rainbow_active = 1

"""""""" airline """""""""""
let g:airline_theme='bubblegum'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible      " be improved, not vi, required
filetype off          " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'

" MarkDown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Rainbow Parentheses
Plugin 'luochen1990/rainbow'

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Themes
Plugin 'connorholyday/vim-snazzy'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Colors, Themes, and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

set background=dark

" encoding and language
set encoding=utf8
set fencs=utf-8,gbk,gb18030,ucs-bom,gb2312

set langmenu=zh_CN.UTF-8
set helplang=cn

"colorscheme snazzy
