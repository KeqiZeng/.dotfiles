#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

TOTAL_DISK=$(df -H | grep -E '^(/dev/disk3s5).' | awk '{ printf ("%s\n", $2) }')
USED_DISK=$(df -H | grep -E '^(/dev/disk3s5).' | awk '{ printf ("%s\n", $3) }')

TOTAL=$(echo $TOTAL_DISK | tr -cd "[0-9]")
USED=$(echo $USED_DISK | tr -cd "[0-9]")
AVAILABLE_DISK="$(($TOTAL - $USED))G"

sketchybar --set "$NAME" label="$AVAILABLE_DISK"
