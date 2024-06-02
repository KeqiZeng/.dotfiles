#!/bin/bash

yabai=(
  padding_left=8
  padding_right=8
  label.padding_right=8
  label.color="$YELLOW"
  script="$SCRIPT_DIR/yabai.sh"
)

sketchybar --add event space_type_change \
           --add event window_focus \
           --add event window_create \
           --add event window_destroy \
           --add event window_minimize \
           --add event window_deminimize \
           --add event window_type_change \
           --add item yabai left \
           --set yabai "${yabai[@]}" \
           --subscribe yabai display_change space_change space_type_change window_focus window_create window_destroy window_minimize window_deminimize window_type_change \
