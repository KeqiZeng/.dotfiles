#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

CPU_USAGE=$(top -l 2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5 }')
CPU_USAGE=$(printf "%.0f" $CPU_USAGE)

case ${CPU_USAGE} in
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

sketchybar --set "$NAME" label="${CPU_USAGE}%" icon.color=${ICON_COLOR}
