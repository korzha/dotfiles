export COLORTERM="truecolor"
export TERM="xterm-256color"

alias v="nvim"
export EDITOR="nvim"
export VISUAL="nvim"

alias y="yazi"
alias z="zoxide"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$HOME/.local/bin:$PATH"
