# -----------------------------------------------------
# UTILS
# -----------------------------------------------------

_check_command_exists() {
  command -v "$1" &>/dev/null
}

# Use powerline
USE_POWERLINE="true"

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

# Load fzf and theme
_check_command_exists "fzf" && eval "$(fzf --zsh)"
_check_command_exists "oh-my-posh" && \
  eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/ohmyposh/base.json)"

## Use base python3 with PyEnv (good for managment uv and jupyter too)
_check_command_exists "pyenv" && \
  eval "$(pyenv init - zsh)" && \
  eval "$(uv generate-shell-completion zsh)"


# Use base nvm
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
