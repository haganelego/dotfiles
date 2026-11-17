#!/bin/bash

sketchybar --add item volume right \
  --set volume script="$PLUGIN_DIR/volume.sh" \
  --subscribe volume volume_change display_volume_change

# Other group: calendar + battery + volume
sketchybar --add bracket others calendar battery volume \
  --set others \
  background.drawing=on \
  background.color="$ITEM_BG_COLOR" \
  background.corner_radius=0 \
  background.height=26 \
  background.border_color=0xff3b4261 \
  background.border_width=2

# Spacer between Others and Resources
sketchybar --add item spacer_or right \
  --set spacer_or \
  background.drawing=off \
  icon.drawing=off \
  label.drawing=off \
  width=8
