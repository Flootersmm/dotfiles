#!/bin/bash

while true; do
  # Stop my computer crashing eventually lol
  pkill -f "swaybg"
  wallpaper=$(find ~/Wallpapers/ -type f | shuf -n1)
  
  # Use wal to generate color scheme
  wal -i "$wallpaper" &

  # and use swaybg to set the wallpaper
  swaybg -i "$wallpaper" -m fill &

  sleep 3600
done
