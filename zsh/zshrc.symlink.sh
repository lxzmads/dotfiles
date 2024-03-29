# shortcut to this dotfiles path is $ZSH
export DOTFILES=$HOME/.dotfiles

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

# load everything but the path and completion files and iterm2_shell_integration files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh:#*/iterm2_shell_integration.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

source $DOTFILES/zsh/iterm2_shell_integration.zsh
source $DOTFILES/zsh/iterm2_tab_color.zsh

unset config_files

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#iterm2_print_user_vars()
#{
#    iterm2_set_user_var python_venv $([ -v PYENV_VERSION ] && (echo $PYENV_VERSION) || (cat ~/.pyenv/version))
#}
