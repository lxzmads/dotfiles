autoload colors && colors

_newline=$'\n'
_lineup=$'\033[1A'
_linedown=$'\033[1B'
_backwardtime=$'\033[2D'

# modify the prompt to contain git branch name if applicable
git_prompt_info () {
    ref=$(git symbolic-ref HEAD 2>/dev/null)
    # echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
    echo " %F{green}${ref#refs/heads/}%f"
}

setopt promptsubst

RPROMPT='%(?..%F{red}-> %?%f)'

# Allow exported PS1 variable to override default prompt.
ITERM2_SQUELCH_MARK="1"
PS1='%F{6}%T%f %F{yellow}%n%f%F{$HOSTCOLOR0}@%m%f %f%F{6}%~%f$(git_prompt_info)${_newline}%{$(iterm2_prompt_mark)%}%f%F{green}%#%f '
