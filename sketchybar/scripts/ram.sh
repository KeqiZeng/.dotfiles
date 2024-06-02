#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

MEMORY_PRESSURE=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%s\n", 100-$5) }')

case ${MEMORY_PRESSURE} in
[8-9][0-9] | 100)
	ICON_COLOR=$RED
	;;
[4-7][0-9])
	ICON_COLOR=$PEACH
	;;
[1-3][0-9])
	ICON_COLOR=$GREEN
	;;
*)
	ICON_COLOR=$GREEN
	;;
esac

sketchybar --set "$NAME" label="${MEMORY_PRESSURE}%" icon.color=${ICON_COLOR}
