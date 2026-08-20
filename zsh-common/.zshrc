# Main zsh configuration file
# Modular configuration loaded from ~/.zsh.d/

# Source all configuration files in order
for config_file in ~/.zsh.d/*.zsh(N); do
  source "$config_file"
done

# Added by Android CLI installer
export PATH="$PATH:/Users/daksh_s/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
