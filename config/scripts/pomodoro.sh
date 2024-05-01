#/bin/bash

if [ $# -eq 0 ]; then
    echo "Please specify a time for the pomodoro length in minutes"
fi

clear
pomodoro start --duration $1 --wait
notify-send "Pomodoro Over! Take a Break!" -w --icon=/usr/share/icons/Paper/512x512/apps/alarm-clock.png
