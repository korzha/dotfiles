export COLORTERM="truecolor"
export TERM="xterm-256color"

test -s ~/.alias && . ~/.alias || true

export EDITOR="nvim"
export VISUAL="nvim"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

eval "$(fzf --bash)"
eval "$(zoxide init bash)"
eval "$(starship init bash)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
