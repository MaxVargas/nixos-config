#!/usr/bin/env bash

# initializing wallpaper daemon
swww-daemon &
# set wallpaper
swww img ~/Pictures/wallpapers/JeanBart.png

# waybar is already started
waybar -c /etc/nixos/home-manager/programs/config/waybar/config.jsonc -s /etc/nixos/home-manager/programs/config/waybar/style.css

# dunst
dunst

# network manager
# install by adding pkgs.networkmanagerapplet to packages
#nm-applet & #--indicator &

# firefox
# firefox

# terminal
# $terminal
