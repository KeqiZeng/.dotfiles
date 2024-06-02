#!/usr/bin/env bash

current_window=$(yabai -m query --windows --window | jq '.id')
num_spaces=$(yabai -m query --spaces | jq length)
current_space=$(yabai -m query --spaces --space | jq '.index')

if [ "$current_space" = "$num_spaces" ]; then
	yabai -m window "$current_window" --space first
else
	yabai -m window "$current_window" --space next
fi
yabai -m window "$current_window" --focus
