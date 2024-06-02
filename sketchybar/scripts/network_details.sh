#!/bin/bash

# SSID="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F ' SSID: '  '/ SSID: / {print $2}')"
IP="$(ipconfig getifaddr en0)"

# LABEL="$([ -n "$IP" ] && echo "$SSID ($IP)" || echo "Not Connected")"
LABEL="$([ -n "$IP" ] && echo "$IP" || echo "Not Connected")"

sketchybar --set network.details label="$LABEL"
