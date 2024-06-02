#!/bin/bash

# source "$HOME/.config/sketchybar/colors.sh"

WIDTH=100

volume_change() {
  source "$HOME/.config/sketchybar/icons.sh"
  LABEL=$INFO

  case $INFO in
    [6-9][0-9]|100)
      ICON=$VOLUME_100
      ;;
    [3-5][0-9])
      ICON=$VOLUME_66
      ;;
    [1-2][0-9])
      ICON=$VOLUME_33
      ;;
    [1-9])
      ICON=$VOLUME_10
      ;;
    0)
      ICON=$VOLUME_0
      LABEL=""
      ;;
    *)
      ICON=$VOLUME_100
  esac

  # case $INFO in
  # [6-9][0-9] | 100)
  #   ICON="墳"
  #   LABEL="${INFO}"
  #   ;;
  # [3-5][0-9])
  #   ICON="奔"
  #   LABEL="${INFO}"
  #   ;;
  # [1-9] | [1-2][0-9])
  #   ICON="奄"
  #   LABEL="${INFO}"
  #   ;;
  # *)
  #   ICON="婢"
  #   LABEL=""
  #   ;;
  # esac

  sketchybar --set volume_icon icon="$ICON" label="$LABEL" \
             --set volume_slider slider.percentage="$INFO"

  # INITIAL_WIDTH="$(sketchybar --query volume_slider | jq -r ".slider.width")"
  # if [ "$INITIAL_WIDTH" -eq "0" ]; then
  #   sketchybar --animate tanh 30 --set volume_slider slider.width=$WIDTH
  # fi

  # sleep 2

  # # Check wether the volume was changed another time while sleeping
  # FINAL_PERCENTAGE="$(sketchybar --query volume_slider | jq -r ".slider.percentage")"
  # if [ "$FINAL_PERCENTAGE" -eq "$INFO" ]; then
  #   sketchybar --animate tanh 30 --set volume_slider slider.width=0
  # fi
}

# mouse_clicked() {
#   # PERCENTAGE="$(sketchybar --query volume_slider | jq -r ".slider.percentage")"
#   # osascript -e "set volume output volume $PERCENTAGE"
#   osascript -e "set volume output volume $(sketchybar --query volume_slider | jq -r ".slider.percentage")"
# }

mouse_clicked() {
  osascript -e "set volume output volume $PERCENTAGE"
}

case "$SENDER" in
  "volume_change") volume_change
  ;;
  "mouse.clicked") mouse_clicked
  ;;
esac
