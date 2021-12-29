#!/bin/bash
# Purpose: Move primary display (must be Display Port 2) far from secondary display using xrandr
# Usage: ./move_main_display.sh <bool>
# <bool> is either 0 or 1.
#       0 indicates moving the main display back to touching the secondary display.
#       1 indicates to move the main display away from the secondary display.

# check if arg exists
if [ $# -eq 0 ]; then
    echo "Please give first argument: 0 or 1"
    echo "0 indicates moving the main display back to touching the secondary display."
    echo "1 indicates to move the main display away from the secondary display."
    exit
fi

if [ $1 == 0 ]; then
    xrandr --output HDMI-0 --rotate left --auto --pos 0x0 --output DP-2 --pos 1080x210 --primary
elif [ $1 == 1 ]; then
    xrandr --output HDMI-0 --rotate left --auto --pos 0x0 --output DP-2 --pos 3080x210 --primary
fi
