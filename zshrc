set -o vi

export PATH=~/git/floating_fzf/bin:$PATH
export PATH=/usr/local/bin:/opt/autoliv/bin:$PATH
export PATH=~/.bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH=~/.yarn/bin:$PATH
# export PATH=/usr/bin:$PATH
# export PATH=~/workdir/neovim-gtk-install/bin:$PATH

setxkbmap -option caps:swapescape

unalias egrep fgrep grep ls l. 2>/dev/null
alias ll='ls --color=always -lh'
alias la='ls --color=always -lha'
alias ls='ls --color=always'
alias grep='grep --color=auto'
alias rgr='grep -ri --color=auto'
alias gc='git commit'
alias go='git checkout'
alias gs='git status -s'
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="nvim ~/.zshrc && reload"
alias ..='cd ..'
alias ...='..;..'
alias ....='...;..'
alias gg='git grep'
alias x='xargs'
alias g='grep'
alias gvir='gvim --remote'

autoload -U colors && colors
autoload zcalc

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LESS=-MRXSi

unset beep
set nobeep

export HISTSIZE=256000
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE

source ~/git/zsh-git-prompt/zshrc.sh
export GIT_PROMPT_EXECUTABLE="haskell"

export LC_NUMERIC=en_US

KEYTIMEOUT=1
WORDCHARS='*?_[]~&;!#$%^(){}<>'

setopt extended_history
setopt inc_append_history
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt share_history
# setopt nomenu_complete
# setopt bash_auto_list
setopt interactivecomments
setopt C_BASES OCTAL_ZEROES
setopt EXTENDED_GLOB BARE_GLOB_QUAL

# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search
# bindkey '^G' what-cursor-position

bindkey '^I' expand-or-complete-prefix
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# This way the completion script does not have to parse Bazel's options
# repeatedly.  The directory in cache-path must be created manually.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^u' kill-whole-line
bindkey '^w' backward-kill-word
# bindkey '^s' kill-word
bindkey '^k' kill-line
bindkey '^d' delete-char

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^F' forward-char
bindkey '^B' backward-char

bindkey -M vicmd 'v' edit-command-line
bindkey -M vicmd '^v' visual-mode
bindkey '^T' spell-word

bindkey '^[[Z' reverse-menu-complete

stty start '^-' stop '^-'
bindkey "^Q" push-input

typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

autoload -U edit-command-line
zle -N edit-command-line

vim_ins_mode="%{$fg[cyan]%}-- INFOGA --%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}-- NORMAL --%{$reset_color%}"
vim_mode=$vim_ins_mode
function zle-line-init zle-keymap-select zle-line-finish {
    RPS1="${${KEYMAP/vicmd/$vim_cmd_mode}/(main|viins)/$vim_ins_mode}"
    RPS2=$RPS1
    zle reset-prompt
    zle -R
}
zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish
setopt transient_rprompt
RPS1="${${KEYMAP/vicmd/$vim_cmd_mode}/(main|viins)/$vim_ins_mode}"

# terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
# function zle-line-init zle-keymap-select {
#     PS1_2="${${KEYMAP/vicmd/$vim_cmd_mode}/(main|viins)/$vim_ins_mode}"
#     PS1="%{$terminfo_down_sc$PS1_2$terminfo[rc]%}%~ %# "
#     zle reset-prompt
# }
# preexec () { print -rn -- $terminfo[el]; }

# PROMPT="%c %% "
PROMPT='%(?/%{$fg[white]%}/%{$fg[red]%})%c %b$(git_super_status) %% % %{$reset_color%}'

autoload -Uz promptinit
promptinit

fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zmodload zsh/mapfile
zmodload zsh/mathfunc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
