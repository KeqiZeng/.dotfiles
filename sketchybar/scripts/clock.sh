#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

# ICON="󰃰"
# ICON_COLOR=$MAROON

sketchybar --set calender.clock label="$(date '+%H:%M:%S')"
# icon="$ICON" icon.color=${ICON_COLOR}
