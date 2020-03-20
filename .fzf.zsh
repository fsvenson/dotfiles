# Setup fzf
# ---------
if [[ ! "$PATH" == */home/fsvenson/.fzf/bin* ]]; then
  export PATH="$PATH:/home/fsvenson/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/fsvenson/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/fsvenson/.fzf/shell/key-bindings.zsh"

