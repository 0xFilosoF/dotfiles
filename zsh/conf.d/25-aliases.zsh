# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

# -----------------------------------------------------
# General
# -----------------------------------------------------
alias c='clear'
alias v='$EDITOR'
alias fd='find'
alias fman="compgen -c | fzf | xargs man"
alias gcm="$ZDOTDIR/gum/commit"
alias chc="$ZDOTDIR/gum/copy-hash-commit"
alias tmux-pick="$ZDOTDIR/gum/pick-tmux-session"

for file in "$ZDOTDIR/functions/"*.zsh; do
  [ -r "$file" ] && source "$file"
done
