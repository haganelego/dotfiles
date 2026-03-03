#!/bin/bash

source "$CONFIG_DIR/colors.sh"

DIM_COLOR="0x40ffffff"

ETHERNET_CONNECTED=false
while IFS= read -r service; do
  case "$service" in
    *Ethernet*|*Thunderbolt*|*USB*|*LAN*|*Bridge*)
      ip=$(networksetup -getinfo "$service" 2>/dev/null | awk -F': ' '/^IP address/{print $2}')
      if [ -n "$ip" ]; then
        ETHERNET_CONNECTED=true
        break
      fi
      ;;
  esac
done < <(networksetup -listallnetworkservices 2>/dev/null | tail -n +2)

if [ "$ETHERNET_CONNECTED" = true ]; then
  sketchybar --set "$NAME" \
    icon=󰈀 \
    icon.color="$WHITE"
else
  sketchybar --set "$NAME" \
    icon=󰈀 \
    icon.color="$DIM_COLOR"
fi
