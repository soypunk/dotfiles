# ============================================================================
# Basic Config
# ============================================================================

#export JAVA_HOME=$(/usr/libexec/java_home)
#export PATH="${JAVA_HOME}/bin:$PATH"

if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi
if [ -d "/usr/local/mysql/bin" ] ; then
	export PATH="/usr/local/mysql/bin:$PATH"
fi

export PS1="\u@\H \w\n\$ "

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

export EDITOR="bbedit"
export VISUAL="bbedit"

# ============================================================================
# Aliases
# ============================================================================

alias ls="ls -l"
alias la="ls -a"

# Reduce top cpu usage: http://hints.macworld.com/article.php?story=20040213045335693
alias ttop="top -ocpu -R -F -s 2 -n30"

alias bb="bbedit"
alias bbf="bbfind"
alias bbd="bbdiff"

#alias mysql_start="sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist"
#alias mysql_stop="sudo launchctl unload -w /Library/LaunchDaemons/com.mysql.mysqld.plist"

# ============================================================================
# Virtualenv
# ============================================================================

export WORKON_HOME=~/envs
#source /usr/local/bin/virtualenvwrapper.sh
