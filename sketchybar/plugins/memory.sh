#!/bin/bash

MEMORY_PERCENT=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{printf "%.0f", 100 - $5}')

sketchybar --set $NAME label="${MEMORY_PERCENT}%"
