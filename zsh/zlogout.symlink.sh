source ./utils.zsh
# Restore iterm's tab color to default.
# Restore session tab color
it2-tab-reset
if [ -n "$IT2_SESSION_COLOR_BEFORE" ]; then
    it2-tab-color $IT2_SESSION_COLOR_BEFORE
    unset IT2_SESSION_COLOR_BEFORE
fi