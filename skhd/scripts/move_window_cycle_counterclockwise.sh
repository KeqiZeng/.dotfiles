#!/usr/bin/env bash

layout=$(yabai -m query --spaces --space | jq -re '.type')
win=$(yabai -m query --windows --window last | jq '.id')

if [ "$layout" = "bsp" ]; then
  while :; do
    yabai -m window "$win" --swap prev &>/dev/null
    if [[ $? -eq 1 ]]; then
      break
    fi
  done
elif [ "$layout" = "stack" ]; then
  yabai -m window "$win" --swap stack.prev || yabai -m window "$win" --swap stack.last &>/dev/null
fi
