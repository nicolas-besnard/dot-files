alias mv="mv -v"
alias cp="cp -v"
alias rm="rm -v"
alias l="ls -l"
alias gs="git s"
alias clean="find . \( -name '*~' -o -name '#*#' -o -name '.DS_Store' -o -name '*.log' \) -delete -exec echo "Removed" {} \;"
alias gitb="sh ~/.bin/gitb.sh"
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias gdc='git difff --cached | less -r'
alias gd='git difff | less -r'
