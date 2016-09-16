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
Plugin 'wincent/command-t'
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
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
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

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <silent> <leader>w :w!<cr>
" Fast editing of the _vimrc
map <silent> <leader>v :e! ~/.vim/vimrc<cr>
autocmd! bufwritepost vimrc source ~/.vimrc   " When vimrc is edited, reload it

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cwd :cd %:p:h<cr>

map <leader>c Yp:.!bc -l<cr>
map <leader>e :e <C-r>=expand("%:p:h") . "/"<cr>

autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

let g:calendar_monday = 1
let g:calendar_weeknm = 2 " WK 1
let g:calendar_mark = 'right'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7   " Set 7 lines to the cursor - when moving vertical
set ruler         " Always show current position
set cmdheight=1   " The commandbar height
set hid           " Change buffer - without saving
set ignorecase    " Ignore case when searching
set smartcase     " Override ignorecase if the pattern contains upper case
set hlsearch      " Highlight search things
set incsearch     " Make search act like search in modern browsers
set nowrapscan    " Turn off search wrapping
set nolazyredraw  " Don't redraw while executing macros
set magic         " Set magic on, for regular expressions
set showmatch     " Show matching bracets when text indicator is over them
set matchtime=2   " How many tenths of a second to blink
set wildmenu      " Turn on WiLd menu
set wildmode=longest,list,full   " Bash style completion
set wildignorecase "When set case is ignored when completing file names and directories
set hidden        " When on a buffer becomes hidden when it is abandoned
set showcmd       " Show (partial) command in the last line of the screen

" Cursor color
"  if &term =~ "xterm\\|rxvt|terminator"
"    " use an green cursor in insert mode
"    let &t_SI = "\<Esc>]12;green\x7"
"    " use a red cursor otherwise
"    let &t_EI = "\<Esc>]12;red\x7"
"    silent !echo -ne "\033]12;red\007"
"    " reset cursor when vim exits
"    autocmd VimLeave * silent !echo -ne "\033]112\007"
"    " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
"  endif

" Cursor shape (not working in terminator)?
"  if &term =~ '^xterm\\|rxvt\\|terminator'
"    " solid underscore
"    let &t_SI .= "\<Esc>[4 q"
"    " solid block
"    let &t_EI .= "\<Esc>[2 q"
"    " 1 or 0 -> blinking block
"    " 3 -> blinking underscore
"    " Recent versions of xterm (282 or above) also support
"    " 5 -> blinking vertical bar
"    " 6 -> solid vertical bar
"  endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab        " Use the appropriate number of spaces to insert a <Tab>
set shiftwidth=3     " Number of spaces to use for each step of (auto)indent
set tabstop=2        " Number of spaces that a <Tab> in the file counts for
set smarttab         " <Tab> in front of a line indents to 'shiftwidth'
set linebreak        " Wrap lines at a char in 'breakat' rather than last char
set textwidth=0      " Maximum width of text that is being inserted
set formatoptions-=c " Don't wrap comments
set autoindent       " Auto indent
set smartindent      " Do smart autoindenting when starting a new line
set nowrap           " Wrap lines
set number
set cursorline

set guioptions=aegitc
nnoremap <leader>m :NERDTreeToggle<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set history=500
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

" Whitespace handling
match Todo /\s\+$/
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

augroup CursorLineOnlyInActiveWindow
   autocmd!
   autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
   autocmd WinLeave * setlocal nocursorline
augroup END

set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile

" persistent undo
set undodir=~/.vim/undodir
" set undodir=/media/sf_FD/undodir
set undofile
set undolevels=700
set undoreload=700

let g:gundo_preview_bottom=1
let g:gundo_right=1
let g:gundo_help=0

nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SplitLocation = 'botright'
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffpanelHeight = 20

" nnoremap <silent> <C-P> :FZF<CR>
command! FZFag call fzf#run({
            \ 'source': 'ag -g"" .',
            \ 'sink': 'e',
            \ 'down': '40%',
            \ 'options': '--expect=ctrl-t,ctrl-v,ctrl-x'})
nnoremap <silent> <C-P> :FZFag<CR>
" nnoremap <silent> <C-P> :FZF<CR>
" let g:ctrlp_match_window = 'max:32'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_max_files = 0         " Set no max file limit
let g:ctrlp_working_path_mode = 0 " Search from current directory instead of project root
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.m$',
    \ 'dir':  '\v[\/](\.git$|Build|BuildScripts)'
    \ }

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set laststatus=2   " Always hide the statusline

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/noring', "~", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Development
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin='/usr/bin/ctags'  " Proper Ctags location
let g:tagbar_compact=1 " Omit short help at the top
let g:tagbar_autoclose=1
let g:tagbar_width=32

let g:ycm_confirm_extra_conf = 0


" Display panel with \l (or ,l)
noremap <silent> <Leader>l :TagbarToggle<cr>
map <silent> gt <C-]>
" map <silent> gp :ptag <c-r><c-w><cr>

noremap <silent> <Leader>d m':%s/\r$//<cr>:set fileformat=dos<cr>`'
" noremap <silent> <Leader>d m':%!dos2unix<cr>:set fileformat=dos<cr>`'

set foldmethod=syntax
set nofoldenable
let g:xml_syntax_folding=1
set colorcolumn=80   " Show where column 80 is.
" colorscheme
set t_Co=256
set background=dark
colorscheme hybrid

set guifont=Inconsolatazi4\ Medium\ 10
syntax on

" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
   autocmd Filetype octave
   \	if &omnifunc == "" |
   \	setlocal omnifunc=syntaxcomplete#Complete |
   \	endif
endif

set path+=..

set cscopetag        " Use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set cscopetagorder=0 " Check cscope for definition of a symbol before ctags
set cscopeprg=/usr/bin/cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-

" :cs add ~/cscope.out ~/git/FdMainAes
" :set csre

" Find this C symbol
nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR><C-O>:cw<CR>
" Find this definition
nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
" Find functions calling this function
nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
" Find this text string
nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
" Find this egrep pattern
nmap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
" Find this file
nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
" Find files #including this file
nmap <leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" Find functions called by this function
nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
" Add cscope.out
nmap <leader>ca :cs add .git/cscope.out .<cr>

nmap <leader>b :cgetfile .do.log<cr>:copen<cr>

" Move about the quickfix list more easily
nmap <leader>n :cnext<cr>
nmap <leader>N :clast<cr>
nmap <leader>p :cprev<cr>
nmap <leader>P :cfirst<cr>

" Change indentation continuously
vmap < <gv
vmap > >gv

" Git status for project
nmap <leader>gs :Gstatus<cr>
" Commit staged files
nmap <leader>gc :Gcommit -v<cr>
" Commit current buffer
nmap <leader>gC :Gcommit -v %<cr>
" Git log for project
nmap <silent> <leader>gl :Glog -256 --<cr>:copen<cr>
" Git log with stat for project
nmap <silent> <leader>gL :Git! log -256 --stat<cr>
" Git log with patch for project
nmap <silent> <leader>gP :Git! log -256 -p<cr>
" Git diff for project
nmap <silent> <leader>gD :Git! diff<cr>
" Git diff current buffer
nmap <silent> <leader>gd :Gdiff<cr>

" set errorformat=\"%f\"\\,\ line\ %l\:\ %m

" SCONS
autocmd BufRead,BufNewFile SConstruct set filetype=python
autocmd BufRead,BufNewFile SConscript set filetype=python
" R or S
autocmd BufRead,BufNewFile *.r set filetype=R
autocmd BufRead,BufNewFile *.json set filetype=javascript
" Template files
autocmd BufRead,BufNewFile *.template set filetype=c
