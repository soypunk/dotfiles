# ============================================================================
# Basic Config
# ============================================================================

if [ -d "$HOME/bin" ] ; then
 PATH="$PATH:$HOME/bin"
fi

export PS1="\w$ "

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# ============================================================================
# Aliases
# ============================================================================

alias la="ls -a"

alias bb="bbedit"
alias bbf="bbfind"
alias bbd="bbdiff"
