# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# eval "$(/opt/homebrew/bin/brew shellenv)"

# ip
# curl -s ip.sb > /tmp/myip

# auto-suggestions
# source $DOTFILES/zsh/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $DOTFILES/zsh/iterm2_shell_integration.zsh
# 忽略 compaudit 的权限检查，防止报错
autoload -Uz compinit
compinit -u
