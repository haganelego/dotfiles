#!/bin/bash

default=(
  padding_left=4
  padding_right=4
  icon.font="HackGen Console NF:Bold:18.0"
  label.font="HackGen Console NF:Bold:15.0"
  icon.color="$WHITE"
  label.color="$WHITE"
  icon.padding_left=4
  icon.padding_right=4
  label.padding_left=4
  label.padding_right=6
  background.color="$ITEM_BG_COLOR"
  background.corner_radius=0
  background.height=26
  background.drawing=off
)

sketchybar --default "${default[@]}"

sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_mode_change
sketchybar --add event display_volume_change
