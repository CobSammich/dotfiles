#!/bin/bash
# Toggles display between single monitor and multiple monitors

if [[ $1 == 1 ]]; then
    # single monitor
    xrandr --output DP-2 --primary --mode 2560x1440 --output HDMI-0 --off --output HDMI-1 --off
    feh --no-fehbg --bg-scale '/home/cob/Pictures/wallpapers/dc_spiderman.png'
elif [[ $1 == 2 ]]; then
    # 2 monitors
    xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --rotate left --auto --pos 0x0 --output DP-2 --pos 1080x240 --primary --output HDMI-1 --off
    feh --no-fehbg --bg-scale '/home/cob/Pictures/wallpapers/dmaztb4adsp61.png' '/home/cob/Pictures/wallpapers/vertical/purple_gradient.jpg'
elif [[ $1 == 3 ]]; then
    # 3 monitors
    xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --rotate left --auto --pos 0x0 --output HDMI-1 --auto --pos 3640x600 --output DP-2 --pos 1080x240 --primary --mode 2560x1440
    feh --no-fehbg --bg-scale '/home/cob/Pictures/wallpapers/dc_spiderman.png' '/home/cob/Pictures/wallpapers/vertical/purple_gradient.jpg' '/home/cob/Pictures/wallpapers/ghost_type.png'
else
    echo "Currently only support for 3 monitors. \"$1\" is not valid. Choose 1, 2, or 3"
fi
