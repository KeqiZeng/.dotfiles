#!/usr/bin/env bash

layout=$(yabai -m query --spaces --space | jq -re '.type')
if [ "$layout" = "float" ]; then
  yabai -m window --focus "$(yabai -m query --windows --space | jq 'map(select(."is-minimized" == false)) | sort_by(.id) | .[(to_entries | .[] | select(.value."has-focus") | .key + 1) % length] | .id')" &>/dev/null
elif [ "$layout" = "bsp" ]; then
  yabai -m window --focus next || yabai -m window --focus first &>/dev/null
else
  yabai -m window --focus stack.next || yabai -m window --focus stack.first &>/dev/null
fi

sketchybar --trigger window_focus
