#!/usr/bin/env bash

# initializing wallpaper daemon
swaybg -i ~/Pictures/wallpapers/JeanBart.png >/dev/null >2&1 &

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
