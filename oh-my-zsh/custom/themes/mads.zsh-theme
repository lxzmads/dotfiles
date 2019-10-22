# kphoen.zsh-theme
# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}

setopt promptsubst

# Allow exported PS1 variable to override default prompt.
if ! env | grep -q '^PS1='; then
  PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '
fi
# if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
#     PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%}:%{$fg[cyan]%}%(5~|%~$(git_prompt_info)
# |%~$(git_prompt_info))%{$reset_color%}%# '

#     ZSH_THEME_GIT_PROMPT_PREFIX=" → %{$fg[green]%}"
#     ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#     ZSH_THEME_GIT_PROMPT_DIRTY=""
#     ZSH_THEME_GIT_PROMPT_CLEAN=""

#     # display exitcode on the right when >0
#     return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

#     RPROMPT='${return_code}$(git_prompt_status)%{$reset_color%}'

#     ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
#     ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
#     ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
#     ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
#     ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
#     ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
# else
#     PROMPT='[%n@%m:%(5~|%~$(git_prompt_info)
# |%~$(git_prompt_info))]%# '

#     ZSH_THEME_GIT_PROMPT_PREFIX=" →"
#     ZSH_THEME_GIT_PROMPT_SUFFIX=""
#     ZSH_THEME_GIT_PROMPT_DIRTY=""
#     ZSH_THEME_GIT_PROMPT_CLEAN=""

#     # display exitcode on the right when >0
#     return_code="%(?..%? ↵)"

#     RPROMPT='${return_code}$(git_prompt_status)'

#     ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
#     ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
#     ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
#     ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
#     ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
#     ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
# fi