#!/bin/bash

down=(
    icon=↓
    icon.color=$WHITE
    icon.padding_right=5
    label.padding_right=8
    padding_left=0
    script="$PLUGIN_DIR/network_rates.sh"
    update_freq=10
)

up=(
    icon=↑
    icon.color=$WHITE
    icon.padding_right=5
    label.padding_right=8
    padding_left=0
    update_freq=10
)

sketchybar \
    --add item net_down right \
    --set net_down "${down[@]}" \
    --add item net_up right \
    --set net_up "${up[@]}"
