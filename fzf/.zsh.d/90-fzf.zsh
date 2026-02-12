# FZF Configuration
if command -v fzf >/dev/null 2>&1; then
  # Use fd for faster file/directory search
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

  # Catppuccin Mocha theme for FZF
  export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--layout=reverse --border --preview-window=right:60% \
--bind=alt-j:down,alt-k:up"

  # FZF key bindings and completion
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  # FZF preview with bat for files and tree for directories
  export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi
