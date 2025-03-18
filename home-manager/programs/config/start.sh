#!/usr/bin/env bash

# initializing wallpaper daemon
swww init &
# set wallpaper
# swww img PATH

# network manager
# install by adding pkgs.networkmanagerapplet to packages
nm-applet --indicator &

# waybar is already started

# dunst
dunst
