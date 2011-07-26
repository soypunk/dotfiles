# ============================================================================
# Basic Config
# ============================================================================

export JAVA_HOME=$(/usr/libexec/java_home)

export PATH="${JAVA_HOME}/bin:$PATH"

if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi
if [ -d "/usr/local/mysql/bin" ] ; then
	export PATH="/usr/local/mysql/bin:$PATH"
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

alias mysql_start="sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist"
alias mysql_stop="sudo launchctl unload -w /Library/LaunchDaemons/com.mysql.mysqld.plist"

# ============================================================================
# Virtualenv
# ============================================================================

export WORKON_HOME=~/envs
source /usr/local/bin/virtualenvwrapper.sh
