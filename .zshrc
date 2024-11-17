autoload -Uz compinit && compinit
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats "(%b)"
precmd () { vcs_info }

PROMPT='%F{cyan}%~ %F{magenta}${vcs_info_msg_0_}
%F{cyan}$%F{white} '

export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
eval "$(rbenv init - zsh)"

alias gg='cd $(ghq list -p | fzf)'
alias ga='git add'
alias gst='git status'
alias gdf='git diff'
alias gdc='git diff --cached'
alias gl='git log --oneline'
alias gr='cd $(git rev-parse --show-toplevel)'

alias ls='ls --color=auto'
alias ll='ls -alF'

