#!/bin/bash

# Check sudo privileges
if [ "$EUID" -ne 0 ]
  then echo "This script has to be run with root! (Hint: Use 'sudo' when running this script)"
  exit
fi

# Variables
BIN_PATH="/usr/local/bin"
BG_PATH="/usr/local/share/backgrounds"

# Create directories if they doesn't already exist 
sudo mkdir -p $BIN_PATH
sudo mkdir -p $BG_PATH


# Add PPAs
echo "Adding additional PPAs..."
sudo add-apt-repository -y ppa:regolith-linux/release > /dev/null # i3-gaps
sudo add-apt-repository -y ppa:aslatter/ppa > /dev/null # alacritty

# Updates
echo "Running apt-get 'update', 'upgrade', and 'autoremove'..."
sudo apt-get -qq update
sudo apt-get -qq upgrade
sudo apt-get -qq autoremove

echo "Installing packages..."

# Install packages 
# xargs -a packages.txt sudo apt-get -qq install

# Install i3 autotiling (.local/bin/autotiling)
sudo apt-get -qq install python3-i3ipc
sudo curl -s -o $BIN_PATH/autotiling -L "https://raw.githubusercontent.com/nwg-piotr/autotiling/master/autotiling/main.py"
sudo chmod +x $BIN_PATH/autotiling

# Install i3status-title-on-bar
sudo curl -s -o $BIN_PATH/i3status-title-on-bar -L "https://github.com/rholder/i3status-title-on-bar/releases/latest/download/i3status-title-on-bar-linux_amd64"
sudo chmod +x $BIN_PATH/i3status-title-on-bar

# Install pfetch (used by ~/.config/fish/config.fish)
sudo curl -s -o $BIN_PATH/pfetch -L "https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch"
sudo chmod +x $BIN_PATH/pfetch

# Install bumblebee-status (for i3 bar)
sudo apt-get -qq install fonts-font-awesome fonts-powerline python3-pip
sudo pip3 install --quiet bumblebee-status
# sudo pip3 install --quiet -t /usr/bin bumblebee-status

# Enable Firewall
echo "Enabling Firewall"
sudo apt-get -qq install gufw
echo "y" | sudo ufw enable

# Wallpaper Setup
echo "Setting up wallpaper for the first time"
sudo curl -s -o $BG_PATH/wallpaper.png -L "https://gitlab.com/ravenjs/dotfiles/-/blob/main/Pictures/Wallpapers/wallpaper.png"
nitrogen --set-zoom-fill $BG_PATH/wallpaper.png

echo "Completed!"
