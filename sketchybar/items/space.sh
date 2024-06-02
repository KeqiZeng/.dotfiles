#!/bin/bash

# source "$HOME/.config/sketchybar/colors.sh"
# SRC_DIR="$HOME/.config/sketchybar/scripts/"

SPACE_ICONS=("􀃋" "􀃍" "􀃏" "􀃑" "􀃓" "􀃕" "􀃗" "􀃙" "􀃛")

sid=0
for i in "${!SPACE_ICONS[@]}"; do
  sid=$(($i+1))

  space=(
    space=$sid
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=5
    icon.padding_right=2
    padding_left=2
    padding_right=2
    label.padding_right=12
    icon.font="$NERD_FONT:bold:12:0"
    icon.color="$FOREGROUND"
    icon.highlight_color="$PINK"
    icon.y_offset=5
    label.color="$OVERLAY"
    label.highlight_color="$YELLOW"
    label.font="sketchybar-app-font:Regular:16.0"
    label.y_offset=-1
    background.color="$SURFACE"
    background.border_width=1
    background.corner_radius=5
    script="$SCRIPT_DIR/space.sh"
)

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked space_windows_change
done

space_separator=(
  icon=""
  icon.color="$LAVENDER"
  padding_left=10
  padding_right=10
  label.drawing=off
  click_script="yabai -m space --create"
)

sketchybar --add item space_separator left \
           --set space_separator "${space_separator[@]}"
