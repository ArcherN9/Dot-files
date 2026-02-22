# FZF Configuration
if command -v fzf >/dev/null 2>&1; then
  # Use fd for faster file/directory search
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

  # Gruvbox Soft theme for FZF
  export FZF_DEFAULT_OPTS=" \
--color=bg+:#3c3836,bg:#32302f,spinner:#8ec07c,hl:#fb4934 \
--color=fg:#d5c4a1,header:#fb4934,info:#d3869b,pointer:#fe8019 \
--color=marker:#fe8019,fg+:#ebdbb2,prompt:#d3869b,hl+:#fb4934 \
--layout=reverse --border --preview-window=right:60% \
--bind=alt-j:down,alt-k:up"

  # FZF key bindings and completion
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  # FZF preview with bat for files and tree for directories
  export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi
