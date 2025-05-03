#!/usr/bin/env bash

# initializing wallpaper daemon
swww-daemon &
# set wallpaper
swww img ~/Pictures/wallpapers/JeanBart.png

# network manager
# install by adding pkgs.networkmanagerapplet to packages
nm-applet --indicator &

# waybar is already started

# dunst
dunst
