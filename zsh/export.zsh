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
export PATH=$PATH:$HOME_DOCPREFIX/app/bin
export PATH=$PATH:/opt/homebrew/bin
