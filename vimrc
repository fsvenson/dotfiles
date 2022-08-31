set shell=bash

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'wincent/command-t'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'Haron-Prime/Antares'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Konfekt/FastFold'
Plug 'airblade/vim-gitgutter'
Plug 'eparreno/vim-matchit'
Plug 'idbrii/vim-hiinterestingword'   " allows for highlighting interesting words in sepparate colors
Plug 'junegunn/vim-peekaboo'
Plug 'michaeljsmith/vim-indent-object'
Plug 'spiiph/vim-space'
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
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'chrisbra/matchit'
Plug 'daeyun/vim-matlab', { 'as': 'neovim-matlab' }
Plug 'tdehaeze/matlab-vim'
Plug 'TheZoq2/neovim-auto-autoread'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvie/vim-flake8'
Plug 'milkypostman/vim-togglelist'
" Plug 'ekalinin/Dockerfile.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
Plug 'srivathsanmurali/OpenAPIValidate.vim'
Plug 'chr4/nginx.vim'
Plug 'embear/vim-uncrustify'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'hashivim/vim-terraform'
" Plug 'github/copilot.vim', {'branch': 'release'}
" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

" Load ESLint 8 compatible CoC plugin
set runtimepath^=~/repos/coc-eslint

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
map <silent> <leader>v :e! ~/.config/nvim/init.vim<cr>
autocmd! bufwritepost init.vim source ~/.config/nvim/init.vim   " When vimrc is edited, reload it

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
set shortmess=aW   " Abbreviate messages to avoid 'hit-enter' prompts
set cmdheight=2

" Automatically resize vertical splits.
autocmd WinEnter * :set winfixheight
autocmd WinEnter * :wincmd =

" Cursor color
 if &term =~ "xterm\\|rxvt|terminator|screen-256color"
   " use an green cursor in insert mode
   let &t_SI = "\<Esc>]12;green\x7"
   " use a red cursor otherwise
   let &t_EI = "\<Esc>]12;red\x7"
   silent !echo -ne "\033]12;red\007"
   " reset cursor when vim exits
   autocmd VimLeave * silent !echo -ne "\033]112\007"
   " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
 endif

" Cursor shape (not working in terminator)?
 if &term =~ '^xterm\\|rxvt\\|terminator|screen-256color'
   " solid underscore
   let &t_SI .= "\<Esc>[4 q"
   " solid block
   let &t_EI .= "\<Esc>[2 q"
   " 1 or 0 -> blinking block
   " 3 -> blinking underscore
   " Recent versions of xterm (282 or above) also support
   " 5 -> blinking vertical bar
   " 6 -> solid vertical bar
 endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab        " Use the appropriate number of spaces to insert a <Tab>
set shiftwidth=2     " Number of spaces to use for each step of (auto)indent
set tabstop=2        " Number of spaces that a <Tab> in the file counts for
set smarttab         " <Tab> in front of a line indents to 'shiftwidth'
set linebreak        " Wrap lines at a char in 'breakat' rather than last char
set textwidth=88     " Maximum width of text that is being inserted
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
nnoremap Y 0y$

" operator flashy - flashes the target of a y<target> command
map y <Plug>(operator-flashy)
" nmap Y <Plug>(operator-flashy)$

" center window after jumping forward
nnoremap n nzz
nnoremap N Nzz
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
" set tags=tags;
" filetype detection
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd FileType c,cpp setlocal shiftwidth=2 tabstop=8
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
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
            \ 'source': 'find . -path "*.venv*" -prune -o -path "*node_modules*" -prune -o -path ./.svn -prune -o -path ./.git -prune -o -path "*pyc" -o -path ./vps/services/build -prune -prune -o -type f -print 2> /dev/null',
            \ 'sink': 'e',
            \ 'down': '40%',
            \ 'options': '--expect=ctrl-t,ctrl-v,ctrl-x'})
nnoremap <silent> <C-P> :FZFag<CR>


command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(expand('<cword>')), 1,
  \   fzf#vim#with_preview(), <bang>0)
nnoremap <Leader>f :Rg<CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <Leader>F :RG<CR>

nnoremap <leader>b :Buffers<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set laststatus=2   " Always hide the statusline

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
set statusline^=%{coc#status()}

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
" {{{ Completion
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

if has('nvim-0.5.0')
  nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
endif


" GitHub Co-pilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:copilot_node_command =
      \ "/se/r3dm/sw/centos-7-x86_64/inst/nodejs/16.13.0/bin/node"


" allow to scroll in the preview
set mouse=a

" mappings
nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
nnoremap <silent> <space>a       :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <space>c       :<C-u>CocFzfList commands<CR>
nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Quickfix
nmap <leader>qf :<C-u>CocCommand tsserver.executeAutofix<CR>

" }}} Completion

" {{{ Location Quickfix
" toggle location and quickfix lists
" mnemonic: list/ ( quick | location )
nnoremap <leader>ll :call ToggleLocationList()<CR>
nnoremap <leader>lq :call ToggleQuickfixList()<CR>
" }}} Location Quickfix

au! BufRead,BufNewFile *.json set filetype=json

map <silent> gt <C-]>

noremap <silent> <Leader>d m':%s/\r$//<cr>:set fileformat=dos<cr>`'

set foldmethod=syntax
set foldlevel=20               " by defualt open folds to level 20
set nofoldenable
let g:xml_syntax_folding=1
set colorcolumn=80   " Show where column 80 is.
" colorscheme
set t_Co=256
set background=dark
colorscheme hybrid

set guifont=Inconsolatazi4\ Medium\ 10
syntax on

set statusline+=%#warningmsg#
set statusline+=%*

" Matlab syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=matlab
  au! BufRead,BufNewFile *.plt set filetype=gnuplot
augroup END

" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
   autocmd Filetype matlab
   \	if &omnifunc == "" |
   \	setlocal omnifunc=syntaxcomplete#Complete |
   \	endif
endif

set path+=..

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
" let g:UltiSnipsExpandTrigger="<c-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsSnippetDirectories=['~/UltiSnips']


" function! ExpandLspSnippet()
"     call UltiSnips#ExpandSnippetOrJump()
"     if !pumvisible() || empty(v:completed_item)
"         return ''
"     endif

"     " only expand Lsp if UltiSnips#ExpandSnippetOrJump not effect.
"     let l:value = v:completed_item['word']
"     let l:matched = len(l:value)
"     if l:matched <= 0
"         return ''
"     endif

"     " remove inserted chars before expand snippet
"     if col('.') == col('$')
"         let l:matched -= 1
"         exec 'normal! ' . l:matched . 'Xx'
"     else
"         exec 'normal! ' . l:matched . 'X'
"     endif

"     if col('.') == col('$') - 1
"         " move to $ if at the end of line.
"         call cursor(line('.'), col('$'))
"     endif

"     " expand snippet now.
"     call UltiSnips#Anon(l:value)
"     return ''
" endfunction

" imap <C-b> <C-R>=ExpandLspSnippet()<CR>


" SCONS
autocmd BufRead,BufNewFile SConstruct set filetype=python
autocmd BufRead,BufNewFile SConscript set filetype=python
" R or S
autocmd BufRead,BufNewFile *.r set filetype=R
" autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd BufRead,BufNewFile Dockerfile* set filetype=dockerfile
autocmd BufRead,BufNewFile *.dock set filetype=dockerfile
" Template files
nmap <silent> ,d <Plug>(coc-definition)
nmap <silent> <C-,> <Plug>(coc-references)
nn <silent> K :call CocActionAsync('doHover')<cr>
set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

let g:sql_type_default = 'pgsql'

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

let g:coc_disable_startup_warning = 1

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

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
nn <silent> xc :call CocLocations('ccls','$ccls/call',{'hierarchy':v:true})<cr>
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
autocmd FileType python let b:coc_root_patterns = ['pyrightconfig.json', '.git']
" }}}
" }}}
"

if has('nvim') | set inccommand=split | endif

let g:clipboard = {
      \   'name': 'xclip',
      \   'copy': {
      \      '+': 'xclip -selection clipboard',
      \      '*': 'xclip -selection clipboard',
      \    },
      \   'paste': {
      \      '+': 'xclip -selection clipboard -o',
      \      '*': 'xclip -selection clipboard -o',
      \   },
      \   'cache_enabled': 1,
      \ }

" Markdown preview
let g:mkdp_open_to_the_world = 1
let g:mkdp_echo_preview_url = 1
let g:mkdp_port = '5000'
let g:mkdp_refresh_slow = 1

let g:python3_host_prog = '/se/home/fresv/.pyvenvs/vps_dev/bin/python3'

" Telescope
lua require('telescope').load_extension('coc')
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" " tree-sitter
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = {"python", "javascript", "c", "cpp", "bash", "json", "tsx"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   ignore_install = {}, -- List of parsers to ignore installing
"   highlight = {
"     enable = true, -- false will disable the whole extension
"     disable = {"bash"},  -- list of language that will be disabled
"   },
" }
" EOF

