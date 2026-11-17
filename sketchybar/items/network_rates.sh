#!/bin/bash

down=(
    icon=↓
    icon.color=$WHITE
    icon.padding_right=5
    label.padding_right=8
    padding_left=0
    script="$PLUGIN_DIR/network_rates.sh"
    update_freq=10
    background.drawing=off
)

up=(
    icon=↑
    icon.color=$WHITE
    icon.padding_right=5
    label.padding_right=8
    padding_left=0
    update_freq=10
    background.drawing=off
)

sketchybar \
    --add item net_down right \
    --set net_down "${down[@]}" \
    --add item net_up right \
    --set net_up "${up[@]}"

# Network group: rates + wifi + ethernet
sketchybar --add bracket network net_down net_up wifi ethernet \
  --set network \
  background.drawing=on \
  background.color="$ITEM_BG_COLOR" \
  background.corner_radius=0 \
  background.height=26 \
  background.border_color=0xff3b4261 \
  background.border_width=2
