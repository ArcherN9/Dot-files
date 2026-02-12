# Main zsh configuration file
# Modular configuration loaded from ~/.zsh.d/

# Source all configuration files in order
for config_file in ~/.zsh.d/*.zsh(N); do
  source "$config_file"
done
