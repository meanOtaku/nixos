#!/usr/bin/env bash

# initialize wallpaper daemon
swww init &
# set wallpaper
swww img ~/nixos/chainsaw.jpg &

# networking
nm-applet --indicator &

waybar &
dunst