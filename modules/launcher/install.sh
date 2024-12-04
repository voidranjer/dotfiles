#!/bin/bash

# Install
sudo apt-get -qq install rofi

# Configure
mkdir -p ~/.config/rofi
touch ~/.config/rofi/config.rasi
if ! grep -Fxq "rofi.theme: /usr/share/rofi/themes/Arc-Dark.rasi" ~/.config/rofi/config.rasi; then
    echo "rofi.theme: /usr/share/rofi/themes/Arc-Dark.rasi" >> ~/.config/rofi/config.rasi
fi