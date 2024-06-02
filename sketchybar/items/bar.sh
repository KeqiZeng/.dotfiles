#!/bin/bash

# source "$HOME/.config/sketchybar/colors.sh"

bar=(
  color="$BACKGROUND"
  # color="$BACKGROUND_TRANSPARENT"
  # blur_radius=8
  height=32
  position=top
  # corner_radius=8
  # border_width=2
  # border_color="$LAVENDER"
  sticky=off
  padding_left=10
  padding_right=10
)

sketchybar --bar "${bar[@]}"
