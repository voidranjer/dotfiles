#!/bin/bash

# Variables
WALLPAPER_DIR_PATH="$HOME/.local/share/wallpapers"
DOWNLOAD_LINK="https://raw.githubusercontent.com/voidranjer/dotfiles/refs/heads/main/modules/wallpaper/black.png"

# Install nitrogen
sudo apt-get -qq install nitrogen

# Wallpaper Setup
echo "Setting up wallpaper for the first time!"
mkdir -p $WALLPAPER_DIR_PATH
sudo curl -s -o $WALLPAPER_PATH/wallpaper.png -L $DOWNLOAD_LINK
nitrogen --set-zoom-fill $WALLPAPER_PATH/wallpaper.png