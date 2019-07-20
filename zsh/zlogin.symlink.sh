# Restore session tab color
if [[ -f /tmp/.madstmpcolor ]]; then
    export IT2_SESSION_COLOR_BEFORE=$(cat /tmp/.madstmpcolor)
    rm -rf /tmp/.madstmpcolor
fi
# Change iterm2's tab color automatically
hostmd5=$(hostname | (md5 2>/dev/null || md5sum 2>/dev/null ));
colorseed=$((16#${hostmd5:0:4}));
colorrgb=$(python3 $DOTFILES/zsh/colorutil.py $colorseed)
it2-tab-color $colorrgb