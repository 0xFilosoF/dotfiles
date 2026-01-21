#!/usr/bin/env zsh

set -e

# ----------------------------------------------------------
# here can be the installation of your favorite packages (not all)
# ----------------------------------------------------------

SCRIPT_PATH="${0:A:h}"

packages=(
  "wget"
  "git"
  "stow"
  "vim"
  "nvim"
  "ghostty"
  "gum"
  "fzf"
  "ripgrep"
  "bat"
  "eza"
  "fd"
  "btop"
  "tmux"
  "yazi"
  "tree-sitter-cli"
  "jq"
)

_is_installed() {
  pacman -Qs "$1" >/dev/null 2>&1
}

_execute_scripts() {
  for file in "$SCRIPT_PATH"/scripts/*.zsh; do
    [ -r "$file" ] && source "$file"
  done
}

_install_packages() {
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

if test -z "$ZSH_VERSION"; then
  shellname=$(ps -p $$ -oargs= | awk 'NR=1{print $1}')
  echo >&2 "Expecting zsh. Found '$shellname'."
  exit 1
fi

read "?Do you want to start installing dependencies? (Y/n): " yn
if [[ ! $yn =~ ^[Yy]$ ]]; then
  echo ":: Installation canceled."
  exit 0
fi

_install_packages "${packages[@]}"
_execute_scripts

stow .
