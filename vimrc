set shell=bash

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
Plug 'wincent/command-t'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'Haron-Prime/Antares'
Plug 'altercation/vim-colors-solarized'
" Plug 'szw/vim-tags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'davidhalter/jedi-vim'
Plug 'majutsushi/tagbar'
Plug 'Konfekt/FastFold'
Plug 'airblade/vim-gitgutter'
Plug 'eparreno/vim-matchit'
Plug 'idbrii/vim-hiinterestingword'   " allows for highlighting interesting words in sepparate colors
Plug 'junegunn/vim-peekaboo'
Plug 'michaeljsmith/vim-indent-object'
Plug 'spiiph/vim-space'
Plug 'ton/vim-bufsurf'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi', { 'on': [] }
Plug 'unblevable/quick-scope'         " shows good targets for f/t to move far on line in specific color
Plug 'vim-scripts/camelcasemotion'
Plug 'mbbill/undotree'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
Plug 'chrisbra/matchit'
Plug 'daeyun/vim-matlab', { 'as': 'neovim-matlab' }
Plug 'tdehaeze/matlab-vim'
Plug 'TheZoq2/neovim-auto-autoread'
" Plug 'autozimu/LanguageClient-neovim', {
"             \ 'branch': 'next',
"             \ 'do': 'bash install.sh',
"             \ }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" All of your Plugins must be added before the following line
call plug#end()            " required
" filetype plugin on
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set autoread
"Autoreload files when changed externally
" if has('nvim') "Prevent errors when using standard vim
"   autocmd VimEnter * AutoreadLoop
" endif

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
set ttyfast                    " 'smooth' scrolling
set virtualedit=block          " allow cursor to be moved into empty space in visual
set splitbelow                 " intuitive split placement
set splitright                 " intuitive split placement
set backspace=2

" Automatically resize vertical splits.
autocmd WinEnter * :set winfixheight
autocmd WinEnter * :wincmd =

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
set textwidth=120    " Maximum width of text that is being inserted
set formatoptions-=c " Don't wrap comments
set autoindent       " Auto indent
set smartindent      " Do smart autoindenting when starting a new line
set nowrap           " Wrap lines
set number
set cursorline       " highlights the line cursor is at
set cursorcolumn     " highlights the column cursor is at
set formatoptions-=t " disable automatic linebreak at textwidth for non-comments
set formatoptions-=c " disable automatic linebreak at textwidth for comments
set formatoptions+=r
set formatoptions+=q
set formatoptions+=o
set formatoptions+=l

" cursorcolumn only in active window
autocmd WinEnter * setlocal cursorcolumn
autocmd WinLeave * setlocal nocursorcolumn

" relative number only in active window
autocmd WinEnter * setlocal relativenumber
autocmd WinLeave * setlocal norelativenumber

" Copy/Paste with os buffer
noremap <leader>y "+y
noremap <leader>Y "+y$
noremap <leader>p "+p
noremap <leader>P "+P
noremap <leader>d "+d
noremap <leader>D "+D

" Y consistent with D
" nnoremap Y 0y$

" operator flashy - flashes the target of a y<target> command
map y <Plug>(operator-flashy)
" nmap Y <Plug>(operator-flashy)$

" center window after jumping forward
nnoremap n nzz
nnoremap } }zz
nnoremap { {zz

" swap ^$ with HL (move to fourth row from top/bottom)
nnoremap H ^
nnoremap ^ H
nnoremap L $
nnoremap $ L

" move by row rather than line
nnoremap j gj
nnoremap k gk
" reverse swap
nnoremap gj j
nnoremap gk k

" Insert and Append on wrapped lines
nnoremap gI g0i
nnoremap gA g$i

set guioptions=aegitc
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" buffer movement
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

autocmd FileType python setlocal shiftwidth=4 tabstop=2

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

nnoremap <silent><C-n> :call ToggleRelativeNumber()<cr>

" toggle relative number for lines
function! ToggleRelativeNumber()
    if(&relativenumber == 1)
        set relativenumber!
        set number
    else
        set relativenumber
    endif
endfunc

" {{{ EasyAlign "
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Don't add spaces around separator
let g:easy_align_left_margin = 0
let g:easy_align_right_margin = 0
" }}} EasyAlign "

" {{{ word motions inside camel/snake case"
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
" }}} word motions inside camel/snake case"

" {{{ GitGutter Sign colors '
highlight GitGutterAdd          ctermbg=232 ctermfg=22
highlight GitGutterChange       ctermbg=232 ctermfg=yellow
highlight GitGutterDelete       ctermbg=232 ctermfg=red
highlight GitGutterChangeDelete ctermbg=232 ctermfg=yellow
" }}} GitGutter Sign colors "
"
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
let g:undotree_WindowLayout = 'botright'
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffpanelHeight = 20

" nnoremap <silent> <C-P> :FZF<CR>
command! FZFag call fzf#run({
            \ 'source': 'list-files . ../../../bazel-bin/external ../../',
            \ 'sink': 'e',
            \ 'down': '40%',
            \ 'options': '--expect=ctrl-t,ctrl-v,ctrl-x'})
nnoremap <silent> <C-P> :FZFag<CR>
" nnoremap <silent> <C-P> :FZF<CR>
" let g:ctrlp_match_window = 'max:32'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
" let g:ctrlp_max_files = 0         " Set no max file limit
" let g:ctrlp_working_path_mode = 0 " Search from current directory instead of project root
" let g:ctrlp_clear_cache_on_exit = 1
" let g:ctrlp_custom_ignore = {
"     \ 'file': '\v\.m$',
"     \ 'dir':  '\v[\/](\.git$|Build|BuildScripts)'
"     \ }

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set laststatus=2   " Always hide the statusline

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/fsvenson', "~", "g")
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

" {{{ Completion
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_server_python_interpreter = '/usr/bin/python2'
" let g:ycm_goto_buffer_command = 'horizontal-split'
" always fill location list with ycm errors/warnings
" let g:ycm_always_populate_location_list = 0
" let g:ycm_auto_trigger=1
" }}} YouCompleteMe
" let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}} Completion

" {{{ Location Quickfix
" toggle location and quickfix lists
" mnemonic: list/ ( quick | location )
nnoremap <leader>ll :call ToggleLocationList()<CR>
nnoremap <leader>lq :call ToggleQuickfixList()<CR>
" }}} Location Quickfix

 " let g:syntastic_python_checkers = ['flake8']
 " let g:syntastic_python_flake8_args='--ignore=E501'
 " let g:syntastic_python_flake8_exec = '/usr/bin/flake8'
au! BufRead,BufNewFile *.json set filetype=json

" Ignore line too long warnings
" let g:ale_linters = {
" \   'matlab': ['mlint'],
" \   'json':   ['fixjson'],
" \   'sh':     ['shellcheck'],
" \}
" " \   'c':      ['cquery'],
" " \   'cpp':    ['cquery'],
" let g:ale_python_pylint_options = '--max-line-length=120 --disable=C0103'
" let g:ale_linters_explicit = 1

set runtimepath+=/home/fsvenson/git/VisionSoftware/Application/FdMainAes/ExtDeps/AesScripts/coding_guidelines/CodingGuidelines/EditorIntegrations/vim
let g:coding_guidelines_linter = '/home/fsvenson/git/VisionSoftware/Application/FdMainAes/ExtDeps/AesScripts/coding_guidelines/CodingGuidelines/Language/C/coding_guidelines/coding_guidelines.py'
let g:coding_guidelines_project_path = '/home/fsvenson/git/VisionSoftware/Application/FdMainAes'
" let g:ale_c_coding_guidelines_project_path = '/home/fsvenson/git/VisionSoftware/Application/FdMainAes'

" Display panel with \l (or ,l)
noremap <silent> <Leader>l :TagbarToggle<cr>
map <silent> gt <C-]>
" map <silent> gp :ptag <c-r><c-w><cr>

noremap <silent> <Leader>d m':%s/\r$//<cr>:set fileformat=dos<cr>`'
" noremap <silent> <Leader>d m':%!dos2unix<cr>:set fileformat=dos<cr>`'

set foldmethod=syntax
set foldlevel=20               " by defualt open folds to level 20
set nofoldenable
let g:xml_syntax_folding=1
set colorcolumn=120   " Show where column 80 is.
" colorscheme
set t_Co=256
set background=dark
colorscheme hybrid

set guifont=Inconsolatazi4\ Medium\ 10
syntax on

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"  let g:syntastic_always_populate_loc_list = 1
"  let g:syntastic_auto_loc_list = 1
"  let g:syntastic_check_on_open = 1
"  let g:syntastic_check_on_wq = 0

" Matlab syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=matlab
  au! BufRead,BufNewFile *.plt set filetype=gnuplot
augroup END

" autocmd FileType matlab source $HOME/.config/nvim/plugged/matlab-vim/ftplugin/matlab.vim
" autocmd FileType matlab source $HOME/.config/nvim/plugged/vim-matlab/ftplugin/matlab.vim
" autocmd FileType matlab source $HOME/.config/nvim/plugged/matlab-vim/syntax/matlab.vim
" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
   autocmd Filetype matlab
   \	if &omnifunc == "" |
   \	setlocal omnifunc=syntaxcomplete#Complete |
   \	endif
endif

set path+=..

set cscopetag        " Use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set cscopetagorder=0 " Check cscope for definition of a symbol before ctags
set cscopeprg=/usr/bin/cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-

fun! RefreshCscope()
   !cscope_refresh
   cs kill 0
   cs add ~/cscope.out
   cs reset
   set csre
endfun

command! CScope call RefreshCscope()

" let g:gutentags_project_root = "/home/fsvenson/git/VisionSoftware/Application/FdMainAes"
" let g:gutentags_modules = ['ctags']
"" enable gtags module
let g:gutentags_modules = ['ctags']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

let g:gutentags_ctags_extra_args = ['--languages=+MatLab']

" forbid gutentags adding gtags databases
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_ctags_exclude = ['*.js', '*.json', '*.c', '*.h', 'Build-*']
" let g:gutentags_plus_nomap = 1

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

" {{{ Fugitive GitGutter and Git "
" populate quicklist with commited version of current file - fugitive
nnoremap <leader>gl :silent Glog<CR>
nnoremap <leader>gc :Gcommit<CR>

nnoremap <leader>gr :GitGutterRevertHunk<CR>
nnoremap <leader>ga :GitGutterStageHunk<CR>
nnoremap <leader>gp :GitGutterPreviewHunk<cr>

autocmd FileType gitcommit setlocal textwidth=72

" }}} Fugitive "

" git conflic marker search
nnoremap <leader>gC /^.*\(<<<\\|====\\|>>>>\).*$<cr>

" set errorformat=\"%f\"\\,\ line\ %l\:\ %m
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', $HOME.'/git/AlvSnippets/Contrib/Vim/snippets', $HOME.'.config/nvim/plugged/neovim-matlab/snippets']

function! ExpandLspSnippet()
    call UltiSnips#ExpandSnippetOrJump()
    if !pumvisible() || empty(v:completed_item)
        return ''
    endif

    " only expand Lsp if UltiSnips#ExpandSnippetOrJump not effect.
    let l:value = v:completed_item['word']
    let l:matched = len(l:value)
    if l:matched <= 0
        return ''
    endif

    " remove inserted chars before expand snippet
    if col('.') == col('$')
        let l:matched -= 1
        exec 'normal! ' . l:matched . 'Xx'
    else
        exec 'normal! ' . l:matched . 'X'
    endif

    if col('.') == col('$') - 1
        " move to $ if at the end of line.
        call cursor(line('.'), col('$'))
    endif

    " expand snippet now.
    call UltiSnips#Anon(l:value)
    return ''
endfunction

imap <C-b> <C-R>=ExpandLspSnippet()<CR>


" SCONS
autocmd BufRead,BufNewFile SConstruct set filetype=python
autocmd BufRead,BufNewFile SConscript set filetype=python
" R or S
autocmd BufRead,BufNewFile *.r set filetype=R
autocmd BufRead,BufNewFile *.json set filetype=javascript
" Template files
autocmd BufRead,BufNewFile *.template set filetype=c
" 'cpp': ['nice', '-19', '/home/fsvenson/git/cquery/release/bin/cquery',
"     '--log-file=/tmp/cq.log'
" ],
" 'c': ['nice', '-19', '/home/fsvenson/git/cquery/release/bin/cquery',
"     '--log-file=/tmp/cq.log'
" ],

"  Clangd LSP {{{
" let g:LanguageClient_serverCommands = {
"             \     'cpp': ['nice', '-19', 'ccls',
"             \         '--log-file=/tmp/ccls.log'
"             \     ],
"             \     'c': ['nice', '-19', 'ccls',
"             \         '--log-file=/tmp/ccls.log'
"             \     ],
"             \     'python': ['nice', '-19',
"             \         'pyls',
"             \         '-vvv', '--log-file', '/tmp/pyls-log.txt'],
"             \ }
" let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
" let g:LanguageClient_settingsPath = '/home/fsvenson/.config/nvim/settings.json'
" set completefunc=LanguageClient#complete
" set formatexpr=LanguageClient_textDocument_rangeFormatting()
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
" let g:LanguageClient_loggingLevel = 'WARN'
" let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
" let g:LanguageClient_diagnosticsList = "location"
" let g:LanguageClient_selectionUI = "quickfix"
" let g:LanguageClient_hasSnippetSupport = 0
nmap <silent> ,d <Plug>(coc-definition)
nmap <silent> <C-,> <Plug>(coc-references)
nn <silent> K :call CocActionAsync('doHover')<cr>
set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')
" nnoremap <silent> ,d :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> ,z :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> ,m :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> ,} :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> ,] :call LanguageClient#textDocument_implementation()<CR>
" nnoremap <silent> ,r :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<CR>:copen<CR>

" augroup LanguageClient_config
"   au!
"   au BufEnter * let b:Plugin_LanguageClient_started = 0
"   au User LanguageClientStarted setl signcolumn=yes
"   au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
"   au User LanguageClientStopped setl signcolumn=auto
"   au User LanguageClientStopped let b:Plugin_LanguageClient_stopped = 0
"   au CursorMoved * if b:Plugin_LanguageClient_started | sil call LanguageClient#textDocument_documentHighlight() | endif
" augroup END

" {{{
" ccls specifics
" bases
nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> xb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> xt <Plug>(coc-type-definition)<cr>
nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

nn xx x
autocmd FileType python let b:coc_root_patterns = ['.fdmainaes-python', '.git', '.env']
" }}}
" }}}
"
source /mnt/d/review.vim

if has('nvim') | set inccommand=split | endif
