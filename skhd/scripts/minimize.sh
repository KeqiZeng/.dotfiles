#!/usr/bin/env bash

last_focused_window=$(yabai -m query --windows --space | jq -re 'map(select(."is-minimized" == false).id) | .[1]')

yabai -m window --minimize && yabai -m window "$last_focused_window" --focus &>/dev/null
