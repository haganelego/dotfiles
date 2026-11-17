#!/bin/bash

bar=(
  position=top
  height=30
  margin=6
  y_offset=4
  corner_radius=0
  border_color=0x00000000
  border_width=0
  blur_radius=20
  color="$BAR_COLOR"
  topmost="window"
)
sketchybar --bar "${bar[@]}"
