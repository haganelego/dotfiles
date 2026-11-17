#!/bin/bash

sketchybar --add item aerospace_mode left \
  --subscribe aerospace_mode aerospace_mode_change \
  --set aerospace_mode icon="" \
  script="$CONFIG_DIR/plugins/aerospace_mode.sh" \
  icon.color="$WHITE" \
  icon.padding_left=4 \
  drawing=off

SPACE_ITEMS=()

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
    background.corner_radius=0 \
    background.height=19 \
    label.drawing=on \
    click_script="aerospace workspace $sid" \
    script="$CONFIG_DIR/plugins/aerospace.sh $sid"

  SPACE_ITEMS+=("space.$sid")
done

sketchybar --add bracket spaces "${SPACE_ITEMS[@]}" \
  --set spaces \
  background.drawing=on \
  background.color="$ITEM_BG_COLOR" \
  background.corner_radius=0 \
  background.height=26 \
  background.border_color=0xff3b4261 \
  background.border_width=2
