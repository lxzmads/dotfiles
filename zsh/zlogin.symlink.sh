# Restore session tab color
if [ -n "$IT2_SESSION_COLOR" ]; then
    export IT2_SESSION_COLOR_BEFORE=$IT2_SESSION_COLOR
    it2-tab-color $IT2_SESSION_COLOR
    # clear
else
    # Change iterm2's tab color automatically
    hostmd5=$(hostname | (md5 2>/dev/null || md5sum 2>/dev/null ));
    colorseed=$((16#${hostmd5:0:4}));
    colorrgb=$(python3 $DOTFILES/zsh/colorutil.py $colorseed)
    it2-tab-color $colorrgb
    # clear
fi