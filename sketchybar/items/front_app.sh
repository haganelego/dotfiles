#!/bin/bash

sketchybar --add item front_app left \
           --set front_app update_freq=6 \
              padding_left=8 \
              background.drawing=on \
              background.corner_radius=0 \
              background.border_color=0xff3b4261 \
              background.border_width=2 \
              icon.color="$WHITE" \
              icon.font="sketchybar-app-font:Regular:13.0" \
              label.color="$WHITE" \
              script="$PLUGIN_DIR/front_app.sh" \
              click_script="$PLUGIN_DIR/sketchymenu/app_menu.sh toggle" \
           --subscribe front_app front_app_switched mouse.exited.global
