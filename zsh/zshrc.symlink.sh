# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/admin/.zsh/completions:"* ]]; then export FPATH="/Users/admin/.zsh/completions:$FPATH"; fi
# shortcut to this dotfiles path is $ZSH
export DOTFILES=$HOME/.dots

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/**/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path, completion, and iTerm2 integration files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  [[ "$file" == */iterm2_shell_integration.zsh ]] && continue
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit -u

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
  source $DOTFILES/zsh/iterm2_shell_integration.zsh
fi

unset config_files

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#iterm2_print_user_vars()
#{
#    iterm2_set_user_var python_venv $([ -v PYENV_VERSION ] && (echo $PYENV_VERSION) || (cat ~/.pyenv/version))
#}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate base

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

. "$HOME/.local/bin/env"

. "/Users/admin/.deno/env"
# Added by Antigravity
export PATH="/Users/admin/.antigravity/antigravity/bin:$PATH"

# opencode
export PATH=/Users/admin/.opencode/bin:$PATH
