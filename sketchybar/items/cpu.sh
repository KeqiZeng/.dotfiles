#!/bin/bash

# SRC_DIR="$HOME/.config/sketchybar/scripts/"

cpu=(
  script="$SCRIPT_DIR/cpu.sh"
  icon="$CPU"
  update_freq=5
)

sketchybar --add item cpu right \
           --set cpu "${cpu[@]}"
