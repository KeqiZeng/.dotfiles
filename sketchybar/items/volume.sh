#!/bin/bash

# SRC_DIR="$HOME/.config/sketchybar/scripts/"

volume_slider=(
  script="$SCRIPT_DIR/volume.sh"
  updates=on
  padding_left=-3
  label.drawing=off
  icon.drawing=off
  slider.highlight_color="$BLUE"
  slider.background.height=4
  slider.background.corner_radius=2
  slider.background.color="$FOREGROUND"
  slider.knob="󰝥"
  slider.knob.drawing=on
)

volume_icon=(
  click_script="$SCRIPT_DIR/volume_click.sh"
  padding_left=10
  icon.color="$BLUE"
  icon.font="$NERD_FONT:Regular:16.0"
  popup.height=30
  popup.y_offset=8
  popup.background.color="$BACKGROUND"
  popup.background.border_width=2
  popup.background.corner_radius=10
  popup.background.border_color="$LAVENDER"
  popup.background.drawing=on
)

sketchybar --add slider volume_slider right            \
           --set volume_slider "${volume_slider[@]}"   \
           --subscribe volume_slider volume_change     \
                              mouse.clicked     \
                                                \
           --add item volume_icon right         \
           --set volume_icon "${volume_icon[@]}" \
           --subscribe volume_icon mouse.clicked
