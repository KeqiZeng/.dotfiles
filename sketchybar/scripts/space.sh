#!/bin/sh

update() {
  source "$HOME/.config/sketchybar/colors.sh"
  BORDER_COLOR="$OVERLAY"
  if [ "$SELECTED" = "true" ]; then
    BORDER_COLOR="$YELLOW"
  fi
  sketchybar --set $NAME icon.highlight=$SELECTED \
                         label.highlight=$SELECTED \
                         background.border_color=$BORDER_COLOR
}

update_space_windows() {
  # [[ "$SELECTED" == 'false' ]] && return 0
  # # RETURN: Error sender
  # [[ "$SENDER" != 'space_windows_change' ]] && echo 'Error SENDER in `update_space_windows`' && return 1

  space="$(echo "$INFO" | jq -r '.space')"  # NOTE: Different with `$SID`
  apps="$(echo "$INFO" | jq -r '.apps | keys[]')"

  icon_strip=''
  if [ "${apps}" != '' ]; then
    while read -r app
    do icon_strip+=" $($HOME/.config/sketchybar/scripts/icon_map.sh "$app")"
    done <<< "${apps}"
  # else icon_strip=' —'
  else icon_strip=''
  fi

  sketchybar --animate sin 10 \
             --set space.$space label="$icon_strip"
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
  else
    yabai -m space --focus $SID 2>/dev/null
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "space_windows_change") update_space_windows
  ;;
  *) update
  ;;
esac
