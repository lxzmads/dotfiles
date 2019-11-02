# list
alias pfl="export GREP_COLOR='1;32' && cat ~/.ssh/config | grep 'Host '|grep --color -E '[^Host].+' && unset GREP_COLOR"
# add
alias pfa="vim ~/.ssh/config"
# delete
alias pfd="vim ~/.ssh/config"
