now_playing=(
    icon.padding_left=6
    icon.padding_right=5
    label.padding_left=0
    label.padding_right=6
    background.padding_right=2
    update_freq=5
    label.font.style="Bold Italic"
    script="$PLUGIN_DIR/now_playing.sh"
    background.drawing=on
    background.color=0xff292e42
    background.corner_radius=0
    background.height=26
    background.border_color=0xff3b4261
    background.border_width=2
    label.color=0xff7dcfff
    drawing=off
    display=1
)

# Now Playing
sketchybar --add item now_playing left \
    --set now_playing "${now_playing[@]}" \
    --add event now_playing_update \
    --subscribe now_playing now_playing_update media_change mouse.clicked mouse.scrolled

# `now_playing_update` event triggering in karabiner elements config after changing MPD player controlling
