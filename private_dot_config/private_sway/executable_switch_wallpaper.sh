#!/bin/bash


# sway itself execs swaybg so we do have an unused swaygb 
# process at all times but no biggie
pkill -f "swaybg"

wallpaper=$(find ~/Wallpapers/ -type f | shuf -n1)

wal -i "$wallpaper" &

swaybg -i "$wallpaper" -m fill &

sleep 2 

nvim --server /tmp/nvim.pipe --remote-send '<ESC><ESC>:colorscheme mbc<ENTER>'
nvim --server /tmp/nvim.pipe --remote-send '<ESC><ESC>:highlight Normal ctermbg=NONE guibg=NONE<ENTER>'
  
pywalfox update

