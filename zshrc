autoload -U compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

autoload -U compinit
compinit

# Aliases
alias grep='grep --color=auto'
alias rgr='grep -ri --color=auto'
alias ll='ls -al'
alias gc='git commit'
alias go='git checkout'
alias gs='git status -s'
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="vim ~/.zshrc && reload"
