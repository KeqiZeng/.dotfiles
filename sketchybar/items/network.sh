#!/bin/bash
# sketchybar --add alias "Stats,Network" right \
#            --rename "Stats,Network" network

# source "$HOME/.config/sketchybar/colors.sh"

# SRC_DIR="$HOME/.config/sketchybar/scripts/"

# POPUP_OFF="sketchybar --set network_pop popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set network_pop popup.drawing=toggle"

network_up=(
  y_offset=7
  label.font="$FONT:Bold:12.0"
  label.color="$FOREGROUND"
  icon="$NETWORK_UP"
  icon.font="$NERD_FONT:Regular:12.0"
  icon.color="$BLUE"
  icon.highlight_color="$GREEN"
  update_freq=1
  click_script="$POPUP_CLICK_SCRIPT"
)

network_down=(
  y_offset=-7
  background.padding_right=-77
  label.font="$FONT:Bold:12.0"
  label.color="$FOREGROUND"
  icon="$NETWORK_DOWN"
  icon.font="$NERD_FONT:Regular:12.0"
  icon.color="$BLUE"
  icon.highlight_color="$GREEN"
  update_freq=1
  script="$SCRIPT_DIR/network.sh"
  click_script="$POPUP_CLICK_SCRIPT"
)

network_pop=(
  # drawing=off
  label=""
  padding_left=0
  padding_right=-15
  popup.height=30
  popup.y_offset=8
  popup.background.color="$BACKGROUND"
  popup.background.border_width=2
  popup.background.corner_radius=10
  popup.background.border_color="$LAVENDER"
  popup.background.drawing=on
)

network_details=(
  label.color="$BLUE"
  script="$SCRIPT_DIR/network_details.sh"
)

sketchybar --add item network.up right \
           --set network.up "${network_up[@]}" \
           --add item network.down right \
           --set network.down "${network_down[@]}" \
           --add item network_pop right \
           --set network_pop "${network_pop[@]}" \
           --add item network.details popup.network_pop \
           --set network.details "${network_details[@]}" \
           --subscribe network.details wifi_change
