#!/bin/bash

# SRC_DIR="$HOME/.config/sketchybar/scripts/"

battery=(
  script="$SCRIPT_DIR/battery.sh"
  label.padding_right=2
  update_freq=120
)

sketchybar --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery system_woke power_source_change
