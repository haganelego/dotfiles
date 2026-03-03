#!/bin/bash

INTERFACE=$(route -n get default 2>/dev/null | awk '/interface:/{print $2}')

if [[ -z "$INTERFACE" ]]; then
    sketchybar --set net_down label="--" --set net_up label="--"
    exit 0
fi

read initial_rx initial_tx < <(netstat -ibn | awk -v iface="$INTERFACE" '$1 == iface && $7 ~ /^[0-9]+$/ && $10 ~ /^[0-9]+$/ {print $7, $10; exit}')
sleep 1
read final_rx final_tx < <(netstat -ibn | awk -v iface="$INTERFACE" '$1 == iface && $7 ~ /^[0-9]+$/ && $10 ~ /^[0-9]+$/ {print $7, $10; exit}')

if [[ -z "$initial_rx" || -z "$final_rx" ]]; then
    sketchybar --set net_down label="--" --set net_up label="--"
    exit 0
fi

DOWN=$((final_rx - initial_rx))
UP=$((final_tx - initial_tx))

human_readable() {
    local bytes=$1
    if [[ "$bytes" -ge 1000000000 ]]; then
        printf "%.1f GB/s" "$(bc -l <<<"$bytes/1000000000")"
    elif [[ "$bytes" -ge 1000000 ]]; then
        printf "%.1f MB/s" "$(bc -l <<<"$bytes/1000000")"
    elif [[ "$bytes" -ge 1000 ]]; then
        printf "%d KB/s" "$(bc <<<"$bytes/1000")"
    else
        printf "%d B/s" "$bytes"
    fi
}

sketchybar --set net_down label="$(human_readable $DOWN)" \
           --set net_up label="$(human_readable $UP)"
