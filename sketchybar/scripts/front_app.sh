#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$INFO" != "" ]; then
  sketchybar --set $NAME label="$INFO" icon.background.image="app.$INFO" \
            --animate tanh 10 \
            --set "$NAME" icon.background.image.scale=1.0 icon.background.image.scale=0.8
fi
