#!/bin/bash

DEVICES="$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq -rc '.SPBluetoothDataType[0].device_connected[] | select ( .[] | .device_minorType == "Headphones")' 2>/dev/null | jq '.[]')"
if [ "$DEVICES" == "" ]; then
  sketchybar --set airpods_battery.left drawing=off \
             --set airpods_battery.right drawing=off
else
  left="$(echo $DEVICES | jq -r .device_batteryLevelLeft | grep -o -E '[0-9]+')"
  right="$(echo $DEVICES | jq -r .device_batteryLevelRight | grep -o -E '[0-9]+')"
  # case="$(echo $DEVICES | jq -r .device_batteryLevelCase)"

  if [[ "$left" == "null"  ]]; then
    left="-"
  fi

  if [[ "$right" == "null" ]]; then
    right='-'
  fi

  # if [[ "$case" == "null" ]]; then
  #   case="-"
  # fi

  LABEL_LEFT="L: $left%"
  LABEL_RIGHT="R: $right%"

  sketchybar --set airpods_battery.left drawing=on label="$LABEL_LEFT" \
             --set airpods_battery.right drawing=on label="$LABEL_RIGHT"
  # sketchybar --set airpods_battery.left drawing=on label="L: 100%" \
  #            --set airpods_battery.right drawing=on label="R: 100%"
fi
