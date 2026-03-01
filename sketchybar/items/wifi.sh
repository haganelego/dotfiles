#!/bin/bash

wifi=(
    script="$PLUGIN_DIR/wifi.sh"
    icon=󰖩
    label.drawing=off
    icon.align=center
    icon.padding_left=4
    icon.padding_right=4
    padding_left=0
    padding_right=0
    background.drawing=off
    update_freq=10
)

ethernet=(
    script="$PLUGIN_DIR/ethernet.sh"
    icon=󰈀
    label.drawing=off
    icon.align=center
    icon.padding_left=4
    icon.padding_right=4
    padding_left=0
    padding_right=0
    background.drawing=off
    update_freq=10
)

sketchybar --add item ethernet right \
           --set ethernet "${ethernet[@]}" \
           --subscribe ethernet system_woke

sketchybar --add item wifi right \
           --set wifi "${wifi[@]}" \
           --subscribe wifi wifi_change system_woke
