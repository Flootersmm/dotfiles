#!/bin/bash

pkill -f "swaybg"

swaybg -i $(find ~/Wallpapers/ -type f | shuf -n1) -m fill &

while true; do
    sleep 6
    pkill -f "swaybg"
    swaybg -i $(find ~/Wallpapers/ -type f | shuf -n1) -m fill &
done
