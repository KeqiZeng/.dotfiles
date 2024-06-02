#!/bin/bash

bracket=(
  background.height=28
  background.color="$SURFACE"
  background.border_color="$LAVENDER"
  background.border_width=1
  background.corner_radius=5
  background.padding_left=5
  background.padding_right=5
)

sketchybar --add bracket bracket_0 network.up network.down disk ram cpu separator_right \
           --set bracket_0 "${bracket[@]}"
