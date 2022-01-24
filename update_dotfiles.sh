#!/bin/bash
# Purpose: To update the dotfiles in ~/.config using symlinks
# Usage: ./update_dotfiles.sh

CONFIG_DIR=$HOME/.config

# iterate over all files in home/
for file in home/.*; do
    if [ -f $file ]; then
        # Get file basename
        basename="${file##*/}"
        echo $basename
        # Delete old file
        rm $HOME/$basename
        # Make symbolic link to file in dotfiles
        echo "ln -sT $file $HOME/$basename"
        ln -sT $PWD/$file $HOME/$basename
    fi
done

# update files under ~/.vim
for file in home/.vim/*; do
    if [ -f $file ]; then
        # Get file basename
        basename="${file##*/}"
        echo $basename
        # Delete old file
        rm $HOME/.vim/$basename
        # Make symbolic link to file in dotfiles
        echo "ln -sT $file $HOME/.vim/$basename"
        ln -sT $PWD/$file $HOME/.vim/$basename
    fi
done

# iterate over all directories in config/ -- goes three directories deep
for file in config/* config/**/* config/**/**/* config/**/**/**/*; do
    if [ -f $file ]; then
        # Get file basename
        basename=${file#*/}
        echo $basename
        # Delete old file
        rm $CONFIG_DIR/$basename
        # Make symbolic link to file in dotfiles
        echo "ln -sT $file $CONFIG_DIR/$basename"
        ln -sT $PWD/$file $CONFIG_DIR/$basename
    fi
done


