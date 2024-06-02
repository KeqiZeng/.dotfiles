#!/usr/bin/env bash

yabai -m query --windows --window $YABAI_WINDOW_ID | jq -re '."can-resize" or ."is-floating"' || yabai -m window $YABAI_WINDOW_ID --toggle float &>/dev/null
sketchybar --trigger window_create &>/dev/null
