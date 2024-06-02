#!/bin/bash

# SCRIPT_DIR="$HOME/.config/sketchybar/scripts/"
# source "$HOME/.config/sketchybar/colors.sh"

brew=(
  script="$SCRIPT_DIR/brew.sh"
  update_freq=300
  icon="$PACKAGE"
  icon.font="$NERD_FONT:Bold:20.0"
  icon.color="$MAUVE"
  icon.padding_left=5
)

sketchybar --add event brew_upgrade \
           --add item brew right \
           --set brew "${brew[@]}" \
           --subscribe brew brew_upgrade
