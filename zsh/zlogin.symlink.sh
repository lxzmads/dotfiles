# Restore session tab color
get_color(){
    python -i -c "from colorutil import rand_hsl;rand_hsl(10);"
}
if [ -n "$IT2_SESSION_COLOR" ]; then
    export IT2_SESSION_COLOR_BEFORE=$IT2_SESSION_COLOR
    it2-tab-color $IT2_SESSION_COLOR
    # clear
else
    # Change iterm2's tab color automatically
    hostmd5=$(hostname | md5sum || md5sum );
    colorseed=$(16#${hostmd5:0:4});
    colorrgb=$(get_color)
    it2-tab-color $colorrgb
    # clear
fi