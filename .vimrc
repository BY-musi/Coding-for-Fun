""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=300

" Sets line number
set number                                  " show line numbers
set relativenumber                          " relative row number

" cursor
set cursorline                              " highlight line cursor
"set cursorcolumn " highlight column cursor

" different cursor shape in different mode
"let &t_SI = "\<ESC>50;CursorShape=1\x7"
"let &t_SR = "\<ESC>50;CursorShape=2\x7"
"let &t_EI = "\<ESC>50;CursorShape=0\x7"

set mouse=a                                 " 允许使用鼠标
set wrap
set shiftround
set clipboard=unnamed
set nocompatible                            " complete vim mode, not compatible vi
set scrolloff=8

" :W => sudo saves the file
" (useful for handling the permission-denied error)
command! W exec 'w !sudo tee % > /dev/null' <bar> edit!

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","

" Move quickly
nnoremap J 6j
nnoremap K 5k

" tab and intent
set smarttab                                " Be smart when using tabs
set expandtab                               " Convent Tab to space
set shiftwidth=4                            " 1 tab == 4 spaces
set tabstop=4
set ai                                      " Auto indent
set si                                      " Smart indent

" auto complete
inoremap {<CR> {<CR>}<ESC>O
"inoremap ( ()<ESC>i
"inoremap { {}<ESC>i
"inoremap [ []<ESC>i
"inoremap ' ''<ESC>i
"inoremap <leader><leader> <ESC>A
"inoremap <C-l> <right>

" enable yank and copy from vim to system, host
vnoremap <leader>y "+yy
nmap <leader>p "+p


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Colors, Themes, and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

set background=dark

" encoding and language
set encoding=utf-8
"language en_US.UTF-8
set fileencodings=utf-8,gbk,gb18030,ucs-bom,gb2312,big5
set fileencoding=utf-8
language message zh_CN.UTF-8
set langmenu=zh_CN.UTF-8
set helplang=cn

"colorscheme snazzy

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

"""""""" neovide """""""""""
let g:neovide_refresh_rate=140
let g:neovide_no_idle=v:true
let g:neovide_fullscreen=v:true
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_animation_length=0.13
let g:neovide_cursor_trail_length=0.5
let g:neovide_cursor_vfx_mode="railgun"


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

Plugin 'ycm-core/YouCompleteMe'
Plugin 'luochen1990/rainbow'                    " Rainbow Parentheses

" tweaks in vim show
" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'connorholyday/vim-snazzy'               " Themes
Plugin 'Kethku/neovide'

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
