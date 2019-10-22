# Pyenv
# pyenv(){
#     export PYENV_ROOT="$HOME/.pyenv"
#     export PATH="$PYENV_ROOT/bin:$PATH"
#     if command -v pyenv 1>/dev/null 2>&1; then
#     eval "$(pyenv init -)"
#     eval "$(pyenv virtualenv-init -)"
#     else
#         pyenv $@
#     fi
# }
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init - zsh --no-rehash)"
fi