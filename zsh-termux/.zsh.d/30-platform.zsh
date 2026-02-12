# Termux/Pixel 7 specific configuration

# Powerlevel10k theme
if [[ -f ~/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source ~/powerlevel10k/powerlevel10k.zsh-theme
fi

# Android SDK paths
export ANDROID_HOME="/home/droid/tools/android_sdk"
export ANDROID_TOOLS="/home/droid/tools/cmdline-tools/bin"
export BUILD_TOOLS="/home/droid/tools/android_sdk/build-tools/23.0.0"
export PLATFORM_TOOLS="/home/droid/tools/android_sdk/platform-tools"

# NVM for Termux
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.local/bin:$ANDROID_TOOLS:$BUILD_TOOLS:$PLATFORM_TOOLS:$PATH"
