#!/bin/bash

# SRC_DIR="$HOME/.config/sketchybar/scripts/"

ram=(
  script="$SCRIPT_DIR/ram.sh"
  icon="$RAM"
  update_freq=5
)

sketchybar --add item ram right \
           --set ram "${ram[@]}"
