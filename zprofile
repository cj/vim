
# MacPorts Installer addition on 2010-02-26_at_20:46:38: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

NVM_DIR=$HOME/.nvm
. $NVM_DIR/nvm.sh
nvm use

JITTER_DIR=$HOME/.jitter

PS1='[%n@%m:%/]%#'

alias hosts='mate /etc/hosts'
alias apache='mate /opt/local/apache2'
alias server='sudo /opt/local/apache2/bin/apachectl'
alias profile='mate ~/.profile'
alias dropbox='cd ~/dropbox/'
alias site='cd ~/dropbox/phpsites/ && cd'
alias sd='cd ~/dropbox/sd/ && cd'
alias phpini='mate /opt/local/etc/php5/php.ini'

alias ape='cd ~/dropbox/phpsites/acd_magicbar/ape/bin && sudo ./aped'

alias gst='git status'
alias gi='mate .gitignore'
alias gil='git update-index --assume-unchanged'
alias gl='git pull'
alias gp='git push'
alias gps='git svn dcommit'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias flushdns="dscacheutil -flushcache"

export EDITOR='mate -w'
