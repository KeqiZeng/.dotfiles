#!/bin/bash

front_app=(
  script="$SCRIPT_DIR/front_app.sh"
  click_script="open -a 'Mission Control'"
  icon.background.drawing=on
  label.padding_left=5
)

sketchybar --add item front_app left \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
