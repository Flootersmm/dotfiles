#!/bin/bash

while true; do
  # Stop my computer crashing eventually lol
  pkill -f "swaybg"
  wallpaper=$(find ~/Wallpapers/ -type f | shuf -n1)
  
  # Use wal to generate color scheme
  wal -i "$wallpaper" &

  # Use swaybg to set the wallpaper
  swaybg -i "$wallpaper" -m fill &

  sleep 2
  # Remote send command to update nvim colour scheme
  nvim --server /tmp/nvim.pipe --remote-send '<ESC><ESC>:colorscheme mbc<ENTER>'
  nvim --server /tmp/nvim.pipe --remote-send '<ESC><ESC>:highlight Normal ctermbg=NONE guibg=NONE<ENTER>'
  
  # Update Firefox theme
  pywalfox update

  sleep 3600
done
