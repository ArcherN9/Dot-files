# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Shell options
setopt autocd

# Vi mode
bindkey -v

# Completion system
autoload -Uz compinit
compinit
