#!/bin/bash

# SRC_DIR="$HOME/.config/sketchybar/scripts/"

disk=(
  script="$SCRIPT_DIR/disk.sh"
  icon="$DISK"
  icon.color="$YELLOW"
  update_freq=60
)

sketchybar --add item disk right \
           --set disk "${disk[@]}"
