autoload -Uz compinit && compinit

PROMPT='%F{cyan}%~
$%F{white} '

export PATH="$PATH:$HOME/.local/bin"

alias gg='cd $(ghq list -p | fzf)'
