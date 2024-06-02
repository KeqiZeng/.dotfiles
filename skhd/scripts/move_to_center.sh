#!/usr/bin/env bash

layout=$(yabai -m query --spaces --space | jq -re '.type')
current_window=$(yabai -m query --windows --window | jq '.id')
is_floating=$(yabai -m query --windows --window "$current_window" | jq '."is-floating" == true')

if [ "$layout" = "float" ] || [ "$is_floating" = true ]; then
	yabai -m window "$current_window" --grid 20:20:3:2:14:16 &>/dev/null
fi
