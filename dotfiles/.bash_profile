#!/usr/local/env bash

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

###############################################################################
### use local directories for homebrew and python
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"


###############################################################################
### link apps to normal app location + easier to access caskroom
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/opt/brew-cask"


###############################################################################
### virtualenv setup and shortcuts
export PIP_REQUIRE_VIRTUALENV=true
export WORKON_HOME="~/envs"
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then . /usr/local/bin/virtualenvwrapper.sh; fi
alias mkvenv="mkvirtualenv"
alias mkvenv3="mkvirtualenv -p python3"
alias rmvenv="rmvirtualenv"
alias lsvenv="lsvirtualenv"


###############################################################################
### shortcuts for editing .bash_profile and ssh configs
export EDITOR='subl'
alias sunano='sudo nano'
alias sublime='sudo open -a "/Applications/Sublime Text.app"'
export TEXT_EDITOR='sublime'
alias modbash="$TEXT_EDITOR ~/.bash_profile"
alias rebash=". ~/.bash_profile"
alias redobash="modbash && rebash"
alias sshconf="$TEXT_EDITOR ~/.ssh/config"
alias sshknown="$TEXT_EDITOR ~/.ssh/known_hosts"
alias sshauthkeys="$TEXT_EDITOR ~/.ssh/authorized_keys"
alias modhosts="$TEXT_EDITOR /private/etc/hosts"


###############################################################################
### UTILITY - requires `brew install coreutils` for linux-style commands on mac
export LS_COMMAND="gls"
alias ls="$LS_COMMAND -Ahl --color --group-directories-first"
alias lsa="$LS_COMMAND -ahl --color --group-directories-first"
alias truncate='gtruncate'
alias who='gwho'
alias whoami='gwhoami'
alias touch='gtouch'
alias tail='gtail'
alias find='gfind'
alias locate='glocate'
alias xargs='gxargs'
alias awk='gawk'


###############################################################################
### general shortcuts
alias mdnsreload="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist && sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist"
alias vpninfo="scutil --nc list"
alias dnsinfo="scutil --dns"
alias dnsflush="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ipecho="wget -qO- http://ipecho.net/plain ; echo"
alias showall="defaults write com.apple.finder AppleShowAllFiles YES; kfinder"
alias showhide="defaults write com.apple.finder AppleShowAllFiles NO; kfinder"
alias kfinder="sudo killall Finder /System/Library/CoreServices/Finder.app"
alias repos="cd ~/git"
alias cask="brew cask"
alias nfind="sudo find / -name"
alias psfind="sudo ps aux | grep -v 'grep' | grep"
alias grep="grep --color"
alias fgrep="fgrep --color"
alias egrep="egrep --color"
alias syslog="sudo cat /var/log/syslog"
alias zero="sudo gtruncate -s 0"


###############################################################################
### FUNCTIONS -- load global functions for shell sessions if available
if [ -f ~/.functions ]; then . ~/.functions; fi


###############################################################################
### ENV -- load global local config for shell sessions if available
if [ -f ~/.environment ]; then . ~/.environment; fi
