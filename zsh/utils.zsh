dotfiles::exists() {
    command -v "$1" > /dev/null 2>&1
}

dotfiles::is_git() {
    [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
}

dotfiles::bold() {
    echo -n "%B$1%b"
}

dotfiles::print() {
    local color content bold
    [[ -n "$1" ]] && color="%F{$1}" || color="%f"
    [[ -n "$2" ]] && content="$2" || content=""

    [[ -z "$2" ]] && content="$1"

    echo -n "$color"
    echo -n "$content"
    echo -n "%{%b%f%}"
}

# ================================================================
# iTerm2 tab color functions
#
# Author: Connor de la Cruz (connor.c.delacruz@gmail.com)
# Repo: https://github.com/connordelacruz/iterm2-tab-color
# ================================================================

# Set the tab color
it2-tab-color() {
    # takes 1 hex string argument or 3 hex values for RGB
    # echo $IT2_SESSION_COLOR
    local R G B
    case "$#" in
        3)
            R="$1"
            G="$2"
            B="$3"
            ;;
        1)
            local hex="$1"
            # Remove leading # if present
            if [[ "${hex:0:1}" == "#" ]]; then
                hex="${hex:1}"
            fi
            # Get hex values for each channel and convert to decimal
            R="$((16#${hex:0:2}))"
            G="$((16#${hex:2:2}))"
            B="$((16#${hex:4}))"
            ;;
        *)
            echo "Usage: it2-tab-color color_hex"
            echo "          color_hex: 6 digit hex value (e.g. 1B2B34)"
            echo "       it2-tab-color r_val g_val b_val"
            echo "          *_val: values for R, G, B from 0-255 (e.g. 27 43 52)"
            return
            ;;
    esac
    echo -ne "\033]6;1;bg;*;default\a"
    echo -ne "\033]6;1;bg;red;brightness;$R\a"
    echo -ne "\033]6;1;bg;green;brightness;$G\a"
    echo -ne "\033]6;1;bg;blue;brightness;$B\a"
    # Export environment variable to maintain colors during session
}

# Reset tab color to default
it2-tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
    # Unset environment variable
    unset IT2_SESSION_COLOR
}

# Check for ~/.base16_theme and set the tab color based on that
it2-b16-theme() {
    if [ -f "$HOME/.base16_theme" ]; then
        local colornum color
        # If no argument was passed, default to color00
        if [ "$#" -lt 1 ]; then
            colornum="00"
        else
            colornum="$1"
        fi
        color="$(perl -nle "print \$& if m{color$colornum=\"\K.*(?=\")}" "$HOME/.base16_theme")"
        it2-tab-color ${color///}
    fi
}
