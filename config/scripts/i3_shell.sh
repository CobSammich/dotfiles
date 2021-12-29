#!/bin/bash
# Purpose: This is used to keep track of the current working directory. Then, when opening a new
# terminal while using i3 the terminal will be opened in that working directory.

WHEREAMI=$(cat /tmp/whereami)
# Change this line for a different terminal emulator
#i3-sensible-terminal --default-working-directory="$WHEREAMI"
echo $WHEREAMI
if [ -z $WHEREAMI ]; then
    WHEREAMI="/home/cob"
fi
alacritty --working-directory "$WHEREAMI"
