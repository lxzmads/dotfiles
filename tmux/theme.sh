#### COLOUR

tm_color_active=colour32
tm_color_inactive=colour241
tm_color_feature=colour206
tm_color_music=colour215
tm_active_border_color=colour240

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
# set-option -g status-bg colour0
set -g status-style fg=$tm_color_active,bg=default,default

# default window title colors
set -g window-status-format "#I #W"
set -g window-status-style fg=$tm_color_inactive,bg=default

# active window title colors
set-window-option -g  window-status-current-format "#[bold]#I #W"
set -g window-status-current-style fg=$tm_color_active,bg=default

# pane border
set -g pane-border-style fg=$tm_color_inactive,fg=$tm_active_border_color

# message text
set -g message-style bg=default,fg=$tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# clock
set-window-option -g clock-mode-colour $tm_color_active

# tm_tunes="#[fg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/tunes.scpt | cut -c 1-50)"
# tm_tunes="#[fg=$tm_color_music]#(osascript -l JavaScript ~/.dotfiles/applescripts/tunes.js)"
# tm_battery="#(~/.dotfiles/bin/battery_indicator.sh)"

# tm_date="#[fg=$tm_color_inactive] %R %d %b"
# tm_host="#[fg=$tm_color_feature,bold]#h"
tm_session_name="#[fg=$tm_color_feature,bold] #S "
tm_proxy_status="#[fg=$tm_color_feature,bold] #(zsh -c 'echo \$ALL_PROXY')"

set -g status-left $tm_session_name
set -g status-right $tm_proxy_status
set -g status-interval 5
