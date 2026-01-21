#!/usr/bin/env zsh

ANTIDOTE_REPO=${XDG_PROJECTS_DIR:-$HOME/Projects}/antidote

if [[ ! -d $ANTIDOTE_REPO ]]; then
  echo ":: Installing antidote..."
  git clone --depth=1 https://github.com/mattmc3/antidote $ANTIDOTE_REPO
  source $ANTIDOTE_REPO/antidote.zsh
  antidote load
else
  echo ":: antidote is already installed."
fi

TMUX_DIR="$HOME/.tmux"

if [[ ! -d $TMUX_DIR ]]; then
  echo ":: Installing tpm..."
  git clone https://github.com/tmux-plugins/tpm $TMUX_DIR/plugins/tpm
else
  echo ":: tpm is already installed."
fi
