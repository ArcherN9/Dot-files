# macOS specific configuration

alias kiro="Electron"

# Powerlevel10k theme
if [[ -f /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
fi

# Export paths
export ADB="$HOME/Library/Android/sdk/platform-tools"
export ZIPALIGN="$HOME/Library/Android/sdk/build-tools/36.0.0"
export JDK="/opt/homebrew/opt/openjdk@17/bin"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet@8/libexec"
export KIRO_CLI="/opt/homebrew/Caskroom/kiro-cli/1.25.1/Kiro CLI.app/Contents/MacOS"
export KIRO="/opt/homebrew/Caskroom/kiro/0.6.0/Kiro.app/Contents/MacOS"
export FIGMA="/opt/homebrew/Caskroom/figma/125.10.8/Figma.app/Contents/MacOS"

# NVM for macOS
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/homebrew/Cellar/nvm/0.40.3/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/homebrew/Cellar/nvm/0.40.3/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# Node.js TLS Configuration for corporate SSL
export NODE_EXTRA_CA_CERTS="$HOME/.ssl/combined-ca-bundle.pem"

# rbenv for macOS
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - --no-rehash zsh)"
fi

export PATH=$ADB:$ZIPALIGN:$JDK:$DOTNET_ROOT:$KIRO_CLI:$KIRO:$FIGMA:$PATH
