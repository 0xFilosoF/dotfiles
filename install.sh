#!/usr/bin/env bash

# ----------------------------------------------------------
# here can be the installation of your favorite packages
# but it was decided to make the installation more modular
# ----------------------------------------------------------

dotfiles_packages=(
  "git"
  "stow"
  "yazi"
  "tmux"
  "fzf"
  "gum"
)

_is_installed() {
  pacman -Qs "$1" >/dev/null 2>&1
}

_check_command_exists() {
    command -v "$1" >/dev/null 2>&1
}

_install_antidote() {
  ANTIDOTE_REPO=${XDG_PROJECTS_DIR:-$HOME/Projects}/antidote

  if [[ ! -d $ANTIDOTE_REPO ]]; then
    echo ":: Installing antidote..."
    git clone --depth=1 https://github.com/mattmc3/antidote $ANTIDOTE_REPO
    source $ANTIDOTE_REPO/antidote.zsh
    antidote load
  else
    echo ":: antidote is already installed."
  fi
}

_install_dragon() {
  DRAGON_REPO=${XDG_PROJECTS_DIR:-$HOME/Projects}/dragon

  if [[ ! -d $DRAGON_REPO ]]; then
    echo ":: Installing dragon..."
    git clone https://github.com/mwh/dragon $DRAGON_REPO
    make -C $DRAGON_REPO install
  else
    echo ":: dragon is already installed."
  fi
}

_install_packages() {
  _install_antidote
  _install_dragon

  if ! _check_command_exists "oh-my-posh"; then
    echo ":: Installing oh-my-posh..."
    curl -s https://ohmyposh.dev/install.sh | bash -s
  else
    echo ":: oh-my-posh is already installed."
  fi

  for pkg in "$@"; do
    if _is_installed "$pkg"; then
      echo ":: ${pkg} is already installed."
    else
      echo ":: Installing ${pkg}..."
      sudo pacman -S "$pkg"
    fi
  done
}

read -p "Do you want to start installing dependencies? (Y/n): " yn
if [[ ! $yn =~ ^[Yy]$ ]]; then
    echo ":: Installation canceled."
    exit 0
fi

_install_packages "${dotfiles_packages[@]}"

stow .
