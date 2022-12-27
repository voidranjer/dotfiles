#!/bin/bash

# Add PPAs
sudo add-apt-repository ppa:regolith-linux/release # i3-gaps
sudo add-apt-repository ppa:aslatter/ppa # alacritty

# Updates
sudo apt -y update && sudo apt -y upgrade

# Install packages (required by ~/.config/i3/config)
sudo apt -y install htop rofi fish ranger nitrogen picom redshift-gtk volumeicon-alsa arandr i3-gaps

# Install other useful packages
sudo apt -y install firefox thunar gedit alacritty vscode

# Install i3 autotiling (.local/bin/autotiling)
sudo apt -y install python-i3ipc
curl -o ~/.local/bin/autotiling -L "https://raw.githubusercontent.com/nwg-piotr/autotiling/master/autotiling/main.py"
sudo chmod +x ~/.local/bin/autotiling

# Install i3status-title-on-bar
curl -o ~/.local/bin/i3status-title-on-bar -L "https://github.com/rholder/i3status-title-on-bar/releases/latest/download/i3status-title-on-bar-linux_amd64"
sudo chmod +x ~/.local/bin/i3status-title-on-bar

# Install pfetch (used by ~/.config/fish/config.fish)
curl -o ~/.local/bin/pfetch -L "https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch"
sudo chmod +x ~/.local/bin/pfetch

# Enable Firewall
sudo apt -y install gufw
echo "y" | sudo ufw enable

# Wallpaper Setup
nitrogen --save ~/Pictures/Wallpapers/wallpaper.png


