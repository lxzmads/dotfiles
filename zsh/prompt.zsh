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

PROMPT='%F{0}%T%f %F{yellow}%n%f%F{$HOSTCOLOR0}@%m%f %f%F{0}%~%f$(git_prompt_info)${_newline}%f%F{green}%#%f '
