#!/bin/bash

source "$CONFIG_DIR/colors.sh"

DIM_COLOR="0x40ffffff"

WIFI_IP=$(networksetup -getinfo "Wi-Fi" 2>/dev/null | awk -F': ' '/^IP address/{print $2}')

if [ -n "$WIFI_IP" ]; then
  sketchybar --set "$NAME" \
    icon=󰖩 \
    icon.color="$ACCENT_COLOR"
else
  sketchybar --set "$NAME" \
    icon=󰖪 \
    icon.color="$DIM_COLOR"
fi
