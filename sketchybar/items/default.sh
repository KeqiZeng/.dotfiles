#!/bin/bash

# source "$HOME/.config/sketchybar/colors.sh"

defaults=(
  icon.font="$NERD_FONT:Bold:16.0"
  icon.padding_right=2
  icon.background.height=20
  icon.background.corner_radius=5
  icon.color="$FOREGROUND"
  label.font="$FONT:Bold:16.0"
  label.color="$FOREGROUND"
  label.padding_left=3
  padding_left=5
  padding_right=5
)

sketchybar --default "${defaults[@]}"
