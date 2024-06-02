#!/bin/bash

# source "$HOME/.config/sketchybar/colors.sh"
# SRC_DIR="$HOME/.config/sketchybar/scripts/"

separator_right=(
  icon=""
  icon.color="$LAVENDER"
  label.drawing=off
  click_script="sketchybar --trigger toggle_stats"
)

sketchybar --add item separator_right right \
           --set separator_right "${separator_right[@]}"

sketchybar --add event hide_stats \
           --add event show_stats \
           --add event toggle_stats \
           \
           --add item animator right \
           --set animator drawing=off \
                          updates=on \
                          script="$SCRIPT_DIR/toogle_stats.sh" \
           --subscribe    animator hide_stats show_stats toggle_stats
