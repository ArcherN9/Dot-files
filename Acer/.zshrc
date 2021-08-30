# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="common"

# Type written theme configuration options
export TYPEWRITTEN_PROMPT_LAYOUT="pure"
export TYPEWRITTEN_SYMBOL="$"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# Do not uncomment this: This is a rather annoying feature in which zsh keeps prompting
# even in cases when the command executed is correct
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

#To supress long username 
export DEFAULT_USER=daksh_s

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  adb
  gitignore
)

# Load configuration files for different tasks
source $ZSH/oh-my-zsh.sh

# Loads FZF configuration file if it exists
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
# Load other configuration files stored in the system. These files may carry configuration for other programs that need to be loaded along with zhrc
#[ -f /Users/daksh_s/.azure/.azure_personal_variable ] && source ~/.azure/.azure_personal_variable
# Load AZ autocompletion script from Bash completion
[ -f /usr/local/etc/bash_completion.d/az ] && source /usr/local/etc/bash_completion.d/az

# Custom key bindings setup for the ZSH terminal
[ -f $HOME/.dot-files/.key_bindings.zsh ] && source $HOME/.dot-files/.key_bindings.zsh

# User configuration

# NVM Configuration for maintaining multiple versions of node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Setting up environment variables required for Pass utility to function properly 
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_DIR=$HOME/.password-store

# NVM for Node management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Bind option + left and option + right key to move words
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh

# Invokes the passwordstore manager program with a customized clip extension to use
# FZF and copy passwords to the clip board
alias pc="pass clip"
alias c="clear"
alias vim="nvim"
alias gpg2=gpg

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --color auto --threads 4'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# To control the command <Leader>-C: Quick enter directories
export FZF_ALT_C_COMMAND="fd --type d --color auto --threads 4"
# Setup a Dracula theme for FZF 
# Refer https://draculatheme.com/fzf
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
    --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
    --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
    --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

export BAT_CONFIG_PATH=$HOME/.dot-files/bat.conf
export RVM=$HOME/.rvm/bin
export ANDROID_SDK_ROOT=$HOME/.android

# Add all to path
export PATH=$PATH:$BAT_CONFIG_PATH:$ANDROID_SDK_ROOT:$RVM
