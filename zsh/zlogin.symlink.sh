source ./utils.zsh
# Restore session tab color
if [ -n "$IT2_SESSION_COLOR" ]; then
    export IT2_SESSION_COLOR_BEFORE=$IT2_SESSION_COLOR
    it2-tab-color $IT2_SESSION_COLOR
    # clear
else
    # Change iterm2's tab color automatically
    hostmd5=$(hostname | md5sum || md5sum );
    colorhex=$(echo ${hostmd5:0:6} | tr a-z A-Z);
    it2-tab-color $colorhex
    # clear
fi