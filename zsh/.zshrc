# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
autoload -Uz compinit
compinit

# Platform detection
if [[ "$OSTYPE" == "darwin"* ]]; then

  alias kiro="Electron"

  # macOS specific configuration
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
  
  export ADB="$HOME/Library/Android/sdk/platform-tools"
  export ZIPALIGN="$HOME/Library/Android/sdk/build-tools/36.0.0"
  export JDK="/opt/homebrew/opt/openjdk@17/bin"
  export DOTNET_ROOT="/opt/homebrew/opt/dotnet@8/libexec"
  export KIRO_CLI="/opt/homebrew/Caskroom/kiro-cli/1.20.0/Kiro CLI.app/Contents/MacOS"
  export KIRO="/opt/homebrew/Caskroom/kiro/0.6.0/Kiro.app/Contents/MacOS"
  export FIGMA="/opt/homebrew/Caskroom/figma/125.10.8/Figma.app/Contents/MacOS"
   
  # NVM for macOS
  export NVM_DIR="$HOME/.nvm"
  [ -s "$HOMEBREW_PREFIX/opt/homebrew/Cellar/nvm/0.40.3/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/homebrew/Cellar/nvm/0.40.3/nvm.sh"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
  
  # Node.js TLS Configuration for corporate SSL
  export NODE_EXTRA_CA_CERTS="$HOME/.ssl/combined-ca-bundle.pem"

  # rbenv for macOS
  eval "$(rbenv init - --no-rehash zsh)"
    
  export PATH=$ADB:$ZIPALIGN:$JDK:$DOTNET_ROOT:$KIRO_CLI:$KIRO:$FIGMA:$PATH
else
  # Linux specific configuration
  source ~/powerlevel10k/powerlevel10k.zsh-theme
  
  export ANDROID_HOME="/home/droid/tools/android_sdk"
  export ANDROID_TOOLS="/home/droid/tools/cmdline-tools/bin"
  export BUILD_TOOLS="/home/droid/tools/android_sdk/build-tools/23.0.0"
  export PLATFORM_TOOLS="/home/droid/tools/android_sdk/platform-tools"
  # NVM for Linux
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

  export PATH="$HOME/.local/bin:$ANDROID_TOOLS:$BUILD_TOOLS:$PLATFORM_TOOLS:$PATH"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source local secrets (not tracked in git)
[ -f ~/.secrets ] && source ~/.secrets

# Password store extensions
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_EXTENSIONS_DIR="$HOME/.password-store/.extensions"

# Common aliases
alias pc="pass clip"
alias c="clear"
alias gpg2=gpg
alias ssh="TERM=xterm-256color $(which ssh)"
alias stripJson=strip-json-comments
alias lsa='ls -lsa --color=auto'
alias ..='cd ..'
alias klogin='kiro-cli login --use-device-flow'
alias kcli='kiro-cli'

# FZF Configuration
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
