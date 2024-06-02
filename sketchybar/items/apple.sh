#!/bin/bash

# source "$HOME/.config/sketchybar/colors.sh"

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set apple.logo popup.drawing=toggle"

apple_logo=(
  icon="$APPLE"
  icon.color="$GREEN"
  padding_left=8
  padding_right=8
  label.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
  popup.height=30
  popup.y_offset=8
  popup.background.color="$BACKGROUND"
  popup.background.border_width=2
  popup.background.corner_radius=10
  popup.background.border_color="$LAVENDER"
  popup.background.drawing=on
)

apple_prefs=(
  icon="$PREFERENCES"
  icon.color="$GREEN"
  icon.padding_left=10
  label="Preferences"
  label.padding_left=12
  label.padding_right=5
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

apple_activity=(
  icon="$ACTIVITY"
  icon.color="$GREEN"
  icon.padding_left=10
  label="Activity"
  label.padding_left=12
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

apple_divider=(
  icon.drawing=off
  label.drawing=off
  background.color="$BLUE"
  background.height=1
  padding_left=10
  padding_right=10
  width=160
  background.drawing=on
)

apple_lock=(
  icon="$LOCK"
  icon.color="$GREEN"
  icon.padding_left=10
  label="Lock Screen"
  label.padding_left=12
  label.padding_right=5
  click_script="osascript -e 'tell application \
              \"System Events\" to keystroke \"q\" \
                using {command down,control down}';
                $POPUP_OFF"
)

apple_logout=(
  icon="$LOGOUT"
  icon.color="$GREEN"
  icon.padding_left=10
  label="Logout"
  label.padding_left=13
  click_script="osascript -e 'tell application \
              \"System Events\" to keystroke \"q\" \
                using {command down,shift down}';
                $POPUP_OFF"
)

apple_sleep=(
  icon="$SLEEP"
  icon.color="$GREEN"
  icon.padding_left=10
  label="Sleep"
  label.padding_left=12
  click_script="osascript -e 'tell app \"System Events\" to sleep'; $POPUP_OFF"
)

apple_reboot=(
  icon="$REBOOT"
  icon.color="$GREEN"
  icon.padding_left=10
  label="Reboot"
  label.padding_left=11
  click_script="osascript -e 'tell app \"loginwindow\" to «event aevtrrst»'; $POPUP_OFF"
)

apple_poweroff=(
  icon="$POWER_OFF"
  icon.color="$GREEN"
  icon.padding_left=10
  label="Power Off"
  label.padding_left=12
  click_script="osascript -e 'tell app \"loginwindow\" to «event aevtrsdn»'; $POPUP_OFF"
)

sketchybar --add item apple.logo left \
           --set apple.logo "${apple_logo[@]}" \
           \
           --add item apple.prefs popup.apple.logo \
           --set apple.prefs "${apple_prefs[@]}" \
           \
           --add item apple.activity popup.apple.logo \
           --set apple.activity "${apple_activity[@]}" \
           \
           --add item apple.divider popup.apple.logo \
           --set apple.divider "${apple_divider[@]}" \
           \
           --add item apple.sleep popup.apple.logo \
           --set apple.sleep "${apple_sleep[@]}" \
           \
           --add item apple.reboot popup.apple.logo \
           --set apple.reboot "${apple_reboot[@]}" \
           \
           --add item apple.poweroff popup.apple.logo \
           --set apple.poweroff "${apple_poweroff[@]}" \
           \
           --add item apple.divider2 popup.apple.logo \
           --set apple.divider2 "${apple_divider[@]}" \
           \
           --add item apple.lock popup.apple.logo \
           --set apple.lock "${apple_lock[@]}" \
           \
           --add item apple.logout popup.apple.logo \
           --set apple.logout "${apple_logout[@]}"
