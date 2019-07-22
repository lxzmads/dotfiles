# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#
ZSH=$HOME/.oh-my-zsh

# customize zsh custom directory.
ZSH_CUSTOM=$DOTFILES/oh-my-zsh/custom

ZSH_THEME="mads"

plugins=(autojump)

source $ZSH/oh-my-zsh.sh
