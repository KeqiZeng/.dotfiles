#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

update_space_type() {
  ICON=""
  ICON_COLOR=""

  SPACE_TYPE="$(yabai -m query --spaces --space | jq -r '.type')"

  if [[ "$SPACE_TYPE" == 'float' ]]; then
    ICON="$YABAI_FLOAT"
    ICON_COLOR="$BLUE"
  elif [[ "$SPACE_TYPE" == 'bsp' ]]; then
    ICON="$YABAI_GRID"
    ICON_COLOR="$GREEN"
  else
    ICON="$YABAI_STACK"
    ICON_COLOR="$MAUVE"
  fi

  sketchybar --set "$NAME" icon="$ICON" icon.color="$ICON_COLOR"
}

update_window_type() {
  LABEL=""

  # NUM_WINDOW="$(yabai -m query --windows --space | jq -re 'map(select(."is-minimized" == false and ."is-floating" == false)) | length')"
  # if [ "$NUM_WINDOW" -ne 0 ]; then
  WINDOW_INFO="$(yabai -m query --windows --window)"
  STACK_INDEX=$(echo "$WINDOW_INFO" | jq '.["stack-index"]')
  if [[ $STACK_INDEX -eq 0 ]]; then
    if [ "$(echo "$WINDOW_INFO" | jq '.["is-floating"]')" = "true" ]; then
      LABEL="float"
    elif [ "$(echo "$WINDOW_INFO" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
      LABEL="fullscreen"
    fi
  else
    LAST_STACK_INDEX=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
    LABEL="$(printf "[%s/%s]" "$STACK_INDEX" "$LAST_STACK_INDEX")"
  fi
  # fi

  sketchybar --set yabai label="$LABEL"
}

# update_space_type
# update_window_type

case "$SENDER" in
  'forced'|'display_change'|'space_change'|'space_type_change')
    update_space_type
    update_window_type
    ;;
  *)
    update_window_type
    ;;
esac
