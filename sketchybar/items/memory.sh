#!/bin/bash

sketchybar --add item memory right \
  --set memory update_freq=5 \
  icon=󰍛 \
  padding_left=0 \
  script="$PLUGIN_DIR/memory.sh"

# Resources group: cpu + memory
sketchybar --add bracket resources cpu memory \
  --set resources \
  background.drawing=on \
  background.color="$ITEM_BG_COLOR" \
  background.corner_radius=0 \
  background.height=26 \
  background.border_color=0xff3b4261 \
  background.border_width=2

# Spacer between Resources and Network
sketchybar --add item spacer_rn right \
  --set spacer_rn \
  background.drawing=off \
  icon.drawing=off \
  label.drawing=off \
  width=8
