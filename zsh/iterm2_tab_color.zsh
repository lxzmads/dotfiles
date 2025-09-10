# it2-tab-color() {
#     # takes 1 hex string argument or 3 hex values for RGB
#     # echo $IT2_SESSION_COLOR
#     local R G B
#     R="$1"
#     G="$2"
#     B="$3"
#     echo -ne "\033]6;1;bg;*;default\a"
#     echo -ne "\033]6;1;bg;red;brightness;$R\a"
#     echo -ne "\033]6;1;bg;green;brightness;$G\a"
#     echo -ne "\033]6;1;bg;blue;brightness;$B\a"
#     # Export environment variable to maintain colors during session
# }
# iterm2_print_user_vars() {
#       if [ -z $IT2_TAB_COLOR ]; then
#         # change tab color
#         it2-tab-color $HOSTCOLORR $HOSTCOLORG $HOSTCOLORB
#         IT2_TAB_COLOR=1
#       fi
# }
# # hook ssh for color reset when session returns
# alias ssh="unset IT2_TAB_COLOR;ssh"
