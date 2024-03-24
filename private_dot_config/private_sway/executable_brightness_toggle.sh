#!/bin/bash

# Set brightness to 1% or 100%, toggling between extremes
toggle_brightness() {
    current_brightness=$(xbacklight -get | cut -d '.' -f 1)
    if [ "$current_brightness" -eq 1 ]; then
        xbacklight -set 100
    elif [ "$current_brightness" -eq 100 ]; then
        xbacklight -set 1
    else
        if [ "$current_brightness" -le 50 ]; then
            xbacklight -set 1
        else
            xbacklight -set 100
        fi
    fi
}

toggle_brightness

