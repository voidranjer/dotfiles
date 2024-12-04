#!/bin/bash

# Variables
WALLPAPER_PATH="/usr/local/share/backgrounds/wallpaper.png"
DOWNLOAD_LINK="https://raw.githubusercontent.com/voidranjer/dotfiles/refs/heads/main/modules/wallpaper/black.png"

# Install nitrogen
sudo apt-get -qq install nitrogen

# Wallpaper Setup
echo "Setting up wallpaper for the first time!"
sudo curl -s -o $WALLPAPER_PATH -L $DOWNLOAD_LINK
nitrogen --set-zoom-fill $WALLPAPER_PATH