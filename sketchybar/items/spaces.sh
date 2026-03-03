#!/bin/bash

sketchybar --add item aerospace_mode left \
  --subscribe aerospace_mode aerospace_mode_change \
  --set aerospace_mode icon="" \
  script="$CONFIG_DIR/plugins/aerospace_mode.sh" \
  icon.color="$WHITE" \
  icon.padding_left=4 \
  drawing=off

for sid in $(aerospace list-workspaces --all); do
  monitor=$(aerospace list-windows --workspace "$sid" --format "%{monitor-appkit-nsscreen-screens-id}")

  if [ -z "$monitor" ]; then
    monitor="1"
  fi

  sketchybar --add item space."$sid" left \
    --subscribe space."$sid" aerospace_workspace_change display_change system_woke mouse.entered mouse.exited \
    --set space."$sid" \
    display="$monitor" \
    padding_right=0 \
    icon="$sid" \
    label.padding_right=7 \
    icon.padding_left=7 \
    icon.padding_right=4 \
    background.drawing=off \
    label.font="sketchybar-app-font:Regular:13.0" \
    background.color="$TRANSPARENT" \
    background.border_color="$ACTIVE_BORDER_COLOR" \
    background.border_width=0 \
    icon.color="$WHITE" \
    label.color="$WHITE" \
    background.corner_radius=7 \
    background.height=19 \
    label.drawing=on \
    click_script="aerospace workspace $sid" \
    script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done

sketchybar --add item space_separator left \
  --set space_separator icon="|" \
  icon.color="$WHITE" \
  icon.padding_left=4 \
  icon.padding_right=7 \
  label.drawing=off \
  background.drawing=off

