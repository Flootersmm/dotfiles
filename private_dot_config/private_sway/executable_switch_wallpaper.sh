#!/bin/bash

# We can use wallpaper indices for a nice gui switcher perhaps

### Iterate through wallpapers

wallpaper_dir=~/Wallpapers/
index_file=~/.cache/current_wallpaper_index

index=$(cat "$index_file" 2>/dev/null || echo 0)

wallpapers=($(find "$wallpaper_dir" -type f))

num_wallpapers=${#wallpapers[@]}

wallpaper=${wallpapers[$index]}

((index++))

if [ $index -ge $num_wallpapers ]; then
    index=0
fi

echo $index > "$index_file"

### Switch wallpapers, set themes

# sway itself execs swaybg so we do have an unused swaygb 
# process at all times but no biggie

pkill -f "swaybg"

wal -i "$wallpaper" &

swaybg -i "$wallpaper" -m fill &

sleep 2 

nvim --server /tmp/nvim.pipe --remote-send '<ESC><ESC>:colorscheme mbc<ENTER>'
nvim --server /tmp/nvim.pipe --remote-send '<ESC><ESC>:highlight Normal ctermbg=NONE guibg=NONE<ENTER>'
  
pywalfox update

