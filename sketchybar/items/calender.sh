#!/bin/bash

date=(
  script="$SCRIPT_DIR/date.sh"
  label.font="$FONT:Bold:12.0"
  label.padding_left=0
  label.y_offset=7
  update_freq=60
)

clock=(
  script="$SCRIPT_DIR/clock.sh"
  label.font="$FONT:Bold:12.0"
  label.y_offset=-7
  label.padding_left=12
  icon="$CALENDER"
  icon.color="$MAROON"
  padding_right=-76
  update_freq=1
)

sketchybar --add item calender.date right \
           --set calender.date "${date[@]}" \
           \
           --add item calender.clock right \
           --set calender.clock "${clock[@]}"
