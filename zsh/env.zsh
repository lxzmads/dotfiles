# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}"

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

export MPROXY="socks5://192.168.7.1:1080"

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/opt/apache-maven/bin:$PATH"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_212.jdk/Contents/Home"
