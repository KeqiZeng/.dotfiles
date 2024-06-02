#!/usr/bin/env bash

layout=$(yabai -m query --spaces --space | jq -re '.type')
win=$(yabai -m query --windows --window first | jq '.id')

if [ "$layout" = "bsp" ]; then
  while :; do
    yabai -m window "$win" --swap next &>/dev/null
    if [[ $? -eq 1 ]]; then
      break
    fi
  done
elif [ "$layout" = "stack" ]; then
  yabai -m window "$win" --swap stack.next || yabai -m window "$win" --swap stack.first &>/dev/null
fi
