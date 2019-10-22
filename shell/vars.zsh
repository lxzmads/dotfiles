# Prefer US English and use UTF-8.
export LANG='zh_CN.UTF-8';
export LC_ALL='zh_CN.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}"

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

[[ $(uname -s) == "Darwin" ]] && export LSCOLORS=exfxcxdxcxegedabagacad