# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
autoload -Uz compinit
compinit
PS1='%n@%m:%~%# '

export ANDROID_HOME="/home/droid/tools/android_sdk"
export ANDROID_TOOLS="/home/droid/tools/cmdline-tools/bin"
export BUILD_TOOLS="/home/droid/tools/android_sdk/build-tools/23.0.0"
export PLATFORM_TOOLS="/home/droid/tools/android_sdk/platform-tools"
export CONTEXT7_API_KEY="ctx7sk-7fef7f5a-3bd3-4743-9eb9-e3ca7366a12f"

export PATH="$HOME/.local/bin:$ANDROID_TOOLS:$BUILD_TOOLS:$PLATFORM_TOOLS:$PATH"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source local secrets (not tracked in git)
[ -f ~/.secrets ] && source ~/.secrets
