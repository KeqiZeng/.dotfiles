#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

OUTDATED_COUNT=$(brew outdated --quiet | wc -l | tr -d " ")

if [ $OUTDATED_COUNT -eq 0 ]; then
  LABEL="✔"
else
  LABEL=$OUTDATED_COUNT
fi

sketchybar --set "$NAME" label="$LABEL"
