# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/daksh_s/.oh-my-zsh

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
)

# Load configuration files for different tasks
source $ZSH/oh-my-zsh.sh

# Loads FZF configuration file if it exists
[ -f /Users/daksh_s/.fzf.zsh ] && source ~/.fzf.zsh
# Load other configuration files stored in the system. These files may carry configuration for other programs that need to be loaded along with zhrc
#[ -f /Users/daksh_s/.azure/.azure_personal_variable ] && source ~/.azure/.azure_personal_variable
# Custom key bindings setup for the ZSH terminal
[ -f /Users/daksh_s/.dot-files/.key_bindings.zsh ] && source /Users/daksh_s/.dot-files/.key_bindings.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Setting up environment variable for td-cli app to detect its database and configuration home
export TD_CLI_HOME=~/.config/td-cli

# Setting up environment variables required for Pass utility to function properly 
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_DIR=~/.password-store

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

# Setup custom export variables
export ADB_HOME=/Users/daksh_s/Library/Android/sdk/platform-tools/
export ANDROID_HOME=/Users/daksh_s/Library/Android/sdk
export PIP=/Users/daksh_s/Library/Python/2.7/lib/python/site-packages
export PIP_INSTALLS=/Users/daksh_s/Library/Python/3.8/bin
export PIP_INSTALLS_2=/usr/local/lib/python3.8/site-packages
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home/jre
export JDK_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export RUBYGEMS_HOME=/usr/local/lib/ruby/gems/2.7.0/bin
export RUBY=/usr/local/opt/ruby/bin
export VIM82=/usr/local/share/vim/vim82/tools
export GOPATH=/Users/daksh_s/.go
export GOROOT="$(brew --prefix golang)/libexec"
export TMPMAIL=/opt/tmpmail

# Entries forefully made to enter due software installations | following variables were suggested to be added to $PATH
export LDFLAGS="-L/usr/local/opt/openssl/lib:-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include:-I/usr/local/opt/ruby/include"
export OPEN_SSL=/usr/local/opt/openssl/bin
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/ruby/lib/pkgconfig"

# Add all to path
export PATH=$VIM82:$RUBYGEMS_HOME:$RUBY:$PATH:$ADB_HOME:$PIP:$ANDROID_HOME:$JAVA_HOME:$JDK_HOME:$LDFFLAGS:$CPPFLAGS:$OPEN_SSL:$PKG_CONFIG_PATH:$PIP_INSTALLS:$PIP_INSTALLS_2:$GOPATH:$GOROOT:$TMPMAIL
