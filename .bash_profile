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
bind 'set completion-ignore-case on'

export EDITOR="bbedit"
export VISUAL="bbedit"

# ============================================================================
# Aliases
# ============================================================================

alias ls="ls -l"
alias la="ls -a"

alias bb="bbedit"
alias bbf="bbfind"
alias bbd="bbdiff"

# ============================================================================
# Virtualenv
# ============================================================================

export WORKON_HOME=~/envs
source /usr/local/bin/virtualenvwrapper.sh
