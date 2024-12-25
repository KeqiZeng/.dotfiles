#!/bin/bash

airpods_battery_left=(
	label.font="$FONT:Bold:12.0"
	label.y_offset=7
	label.width=60
	# label.padding_right=8
	padding_right=5
)

airpods_battery_right=(
	icon="$AIRPODS"
	icon.color="$PINK"
	label.font="$FONT:Bold:12.0"
	label.y_offset=-7
	label.width=60
	label.padding_left=3
	padding_right=-68
	script="$SCRIPT_DIR/airpods_battery.sh"
	update_freq=120
)

sketchybar --add event bluetooth_change "com.apple.bluetooth.status" \
	--add item airpods_battery.left right \
	--add item airpods_battery.right right \
	--set airpods_battery.left "${airpods_battery_left[@]}" \
	--set airpods_battery.right "${airpods_battery_right[@]}" \
	--subscribe airpods_battery.right bluetooth_change
