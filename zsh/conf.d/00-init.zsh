## -----------------------------------------------------
# INIT
# -----------------------------------------------------
export ANTIDOTE_DIR="$XDG_PROJECTS_DIR/antidote"
source $ANTIDOTE_DIR/antidote.zsh
antidote load $ZDOTDIR/.zsh_plugins.txt

source "$HOME/.cargo/env"

# -----------------------------------------------------
# Exports
# -----------------------------------------------------
export EDITOR=nvim
export PATH=$PATH:$HOME/.cargo/bin/
export PATH=$PATH:$HOME/.local/bin/
export PYENV_DIR="$HOME/.pyenv" 
[[ -d $PYENV_DIR/bin ]] && export PATH="$PYENV_DIR/bin:$PATH" 
export NVM_DIR="$HOME/.nvm"

FOUNDRY_DIR="$HOME/.foundry"
if [[ -n $FOUNDRY_DIR && -d $FOUNDRY_DIR ]]; then
  export PATH=$PATH:$HOME/.foundry/bin/
fi



