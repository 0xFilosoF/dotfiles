#!/usr/bin/env zsh

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
  "btop"
)

_is_installed() {
  pacman -Qs "$1" >/dev/null 2>&1
}

_check_command_exists() {
  command -v "$1" >/dev/null 2>&1
}

_install_packages() {
  SCRIPT_PATH="${0:A:h}"

  source $SCRIPT_PATH/scripts/antidote.sh
  source $SCRIPT_PATH/scripts/dragon.sh

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
      # TODO: after sometimes change to `yay --noconfirm -S "$pkg"`
      sudo pacman -S "$pkg"
    fi
  done
}

# if test -z "$ZSH_VERSION"; then
#   shellname=$(ps -p $$ -oargs= | awk 'NR=1{print $1}')
#   echo >&2 "Expecting zsh. Found '$shellname'."
#   exit 1
# fi

# read -p "Do you want to start installing dependencies? (Y/n): " yn
# if [[ ! $yn =~ ^[Yy]$ ]]; then
#   echo ":: Installation canceled."
#   exit 0
# fi

_install_packages "${dotfiles_packages[@]}"

# stow .
