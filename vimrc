set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
" Plugin 'spolu/dwm.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'godlygeek/tabular'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'Haron-Prime/Antares'
Plugin 'altercation/vim-colors-solarized'
Plugin 'szw/vim-tags'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" auto-reload
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" tabs
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
set cursorline
" colorscheme
set t_Co=256
set background=dark
colorscheme antares

set guifont=Inconsolata\ Medium\ 12
syntax on

set guioptions=aegitc
nmap <silent> <C-m> :NERDTreeToggle<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set history=50
set ruler
set showcmd
set incsearch
set hlsearch
" tags
set tags=tags;
" filetype detection
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
 
  autocmd FileType text setlocal textwidth=78
 
" jump to last known position
  autocmd BufReadPost *
    \ if line("'\"")  <= line("$") |
    \      exec "normal g`\"" |
    \ endif
 
  augroup END
 
else
 
   set autoindent
 
endif
 
 
augroup CursorLineOnlyInActiveWindow
   autocmd!
   autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
   autocmd WinLeave * setlocal nocursorline
augroup END
 
set noshowmode
