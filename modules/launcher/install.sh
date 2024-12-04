#!/bin/bash

# Install
sudo apt-get -qq install rofi

# Configure
mkdir -p ~/.config/rofi
touch ~/.config/rofi/config
if ! grep -Fxq "rofi.theme: /usr/share/rofi/themes/Arc-Dark" ~/.config/rofi/config; then
    echo "rofi.theme: /usr/share/rofi/themes/Arc-Dark" >> ~/.config/rofi/config
fi