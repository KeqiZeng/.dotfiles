#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
	exit 0
fi

case ${PERCENTAGE} in
9[0-9] | 100)
	ICON="$BATTERY_100"
	ICON_COLOR="$GREEN"
	;;
[7-8][0-9])
	ICON="$BATTERY_75"
	ICON_COLOR=$YELLOW
	;;
[4-6][0-9])
	ICON="$BATTERY_50"
	ICON_COLOR=$PEACH
	;;
[1-3][0-9])
	ICON="$BATTERY_25"
	ICON_COLOR=$MAROON
	;;
*)
	ICON="$BATTERY_0"
	ICON_COLOR=$RED
	;;
esac

if [[ $CHARGING != "" ]]; then
	ICON="$BATTERY_CHARGING"
	ICON_COLOR=$BLUE
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set $NAME label="${PERCENTAGE}" icon="$ICON" icon.color=${ICON_COLOR}
