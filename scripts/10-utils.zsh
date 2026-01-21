#!/usr/bin/env zsh

DRAGON_REPO=${XDG_PROJECTS_DIR:-$HOME/Projects}/dragon

if [[ ! -d $DRAGON_REPO ]]; then
  echo ":: Installing dragon..."
  git clone https://github.com/mwh/dragon $DRAGON_REPO
  make -C $DRAGON_REPO install
else
  echo ":: dragon is already installed."
fi

if command -v oh-my-posh &>/dev/null; then
  echo ":: oh-my-posh is already installed."
else
  echo ":: Installing oh-my-posh..."
  curl -s https://ohmyposh.dev/install.sh | bash -s
fi

NVM_DIR="$HOME/.nvm"

if [[ ! -d $NVM_DIR ]]; then
  echo ":: Installing nvm..."
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
else
  echo ":: nvm is already installed."
fi

PYENV_DIR="$HOME/.pyenv" 

if [[ ! -d $PYENV_DIR ]]; then
  echo ":: Installing pyenv..."
  curl -fsSL https://pyenv.run | bash
else
  echo ":: pyenv is already installed."
fi

