# reload zsh config
alias reload!='RELOAD=1 source ~/.zshrc'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # macOS `ls`
    colorflag="-G"
fi

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
if [[ "$(uname)" == "Darwin" ]] ; then
alias sub="cd $HOME_DOCPREFIX/网络/sub/"
alias pl="cd $HOME_DOCPREFIX/tmp/"
alias ctf="cd $HOME_DOCPREFIX/安全/CTF/2022/"
alias ctool="cd $HOME_DOCPREFIX/bin/sec/web"
alias d="cd $HOME_DOCPREFIX/"
fi
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias sc="rsync -e ssh -avh --delete --no-owner --no-group"

alias ls="ls ${colorflag}"
alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# Applications for Mac
if [[ "$(uname)" == "Darwin" ]] ; then
alias ios='open -a /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"

# clipboard
alias y="pbcopy"
alias p="pbpaste"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
alias canary="/Applications/Google\\ Chrome\\ Canary.app/Contents/MacOS/Google\\ Chrome\\ Canary"

alias pcat='pygmentize -f terminal256 -O style=native -g'

# For Cross Site Script Test
alias xsschrome="chromekill && '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' --disable-xss-auditor --enable-devtools-experiments --disable-features=enable-automatic-password-saving"
fi
# IP addresses
alias localip="hostname -I"
[[ "$(uname)" == "Darwin" ]] && alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
# remove broken symlinks
alias clsym="find -L . -name . -o -type d -prune -o -type l -exec rm {} +"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# for typora
alias note="open -a Typora '/Users/mads/Library/Mobile Documents/com~apple~CloudDocs/TypoNote/Notebooks/'"

# shortcut
alias genpass="openssl rand -base64 10 | tee /dev/tty | pbcopy"

