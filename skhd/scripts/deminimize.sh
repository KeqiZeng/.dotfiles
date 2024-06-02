#!/usr/bin/env bash

minimized_window=$(yabai -m query --windows --space | jq -re 'map(select(."app" != "kitty" or ."title" != "Scratchpad") | select(."is-minimized" == true).id) | .[0]')

yabai -m window "$minimized_window" --focus &>/dev/null
