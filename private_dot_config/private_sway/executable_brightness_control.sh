#!/bin/bash

decrease_brightness() {
    current_brightness=$(xbacklight -get | cut -d '.' -f 1)
    if [ "$current_brightness" -le 5 ]; then
        if [ "$current_brightness" -gt 1 ]; then
            xbacklight -set 1
        else
            xbacklight -set 0
        fi
    else
        xbacklight -dec 5
    fi
}

increase_brightness() {
    current_brightness=$(xbacklight -get | cut -d '.' -f 1)
    if [ "$current_brightness" -eq 0 ]; then
        xbacklight -set 1
    elif [ "$current_brightness" -lt 5 ]; then
        xbacklight -set 5
    else
        xbacklight -inc 5
    fi
}

case "$1" in
    up)
        increase_brightness
        ;;
    down)
        decrease_brightness
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

