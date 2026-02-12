# Set default editor
export EDITOR=nvim
export VISUAL=nvim

# Edit command line in $EDITOR with Alt-e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line
