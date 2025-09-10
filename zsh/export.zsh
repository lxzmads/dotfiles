# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
#export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}"

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$DOTFILES/bin
export PATH=$PATH:$HOME/codeql-home/codeql/
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH=$PATH:/usr/local/sbt/bin
export PATH=$PATH:/usr/local/apache-maven-3.8.6/bin
export PATH=$PATH:$HOME/SynologyDrive/apps/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$HOME/.jenv/shims/:$PATH
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
