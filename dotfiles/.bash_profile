#!/usr/local/env bash

if [ -f ~/.bashrc ]; then source ~/.bashrc; fi
if [ -f ~/.functions ]; then source ~/.functions; fi

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
source /usr/local/bin/virtualenvwrapper.sh
#export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python2.7"
alias mkvenv="mkvirtualenv"
alias lsvenv="lsvirtualenv"
alias rmvenv="rmvirtualenv"
#alias mkvenv3="mkvirtualenv -p python3"


###############################################################################
### editing shortcuts
alias sublime="sudo subl"
export TEXT_EDITOR="sublime"
export EDITOR="subl"

alias profileedit="$TEXT_EDITOR ~/.bash_profile"
alias profileload="source ~/.bash_profile"
alias reprofile="profileedit && profileload"

alias sshconf="$TEXT_EDITOR ~/.ssh/config"
alias sshhosts="$TEXT_EDITOR ~/.ssh/known_hosts"
alias sshauthed="$TEXT_EDITOR ~/.ssh/authorized_keys"

alias hosts="sudo sublime /private/etc/hosts"


###############################################################################
### general shortcuts
alias resetdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ipecho="wget -qO- http://ipecho.net/plain ; echo"
alias showall="defaults write com.apple.finder AppleShowAllFiles YES; kfinder"
alias showhide="defaults write com.apple.finder AppleShowAllFiles NO; kfinder"
alias kfinder="sudo killall Finder /System/Library/CoreServices/Finder.app"
alias repos="cd ~/git"
alias cask="brew cask"


###############################################################################
### UTILITY -- requires `brew install coreutils` for linux-style ls on mac
export LS_COMMAND="gls"
alias ls="$LS_COMMAND"
alias lsa="ls -Ahl --color --group-directories-first"
alias lsaa="ls -ahl --color --group-directories-first"
alias nfind="sudo find / -name"
alias psfind="ps aux | grep"
