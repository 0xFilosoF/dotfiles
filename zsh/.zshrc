# Add additional configurations here (loading after .zshenv and conf.d)

for file in "$ZDOTDIR/conf.d/"*.zsh; do
  [ -r "$file" ] && source "$file"
done

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
