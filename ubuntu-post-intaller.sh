#!/bin/bash

# Check sudo privileges
if [ "$EUID" -ne 0 ]
  then echo "This script has to be run with root! (Hint: Use 'sudo' when running this script)"
  exit
fi


# Add PPAs
echo "Adding additional PPAs..."
sudo add-apt-repository -y ppa:regolith-linux/release > /dev/null # i3-gaps
sudo add-apt-repository -y ppa:aslatter/ppa > /dev/null # alacritty

# Updates
echo "Running 'apt-get update, upgrade, and autoremove'"
sudo apt-get -qq update
sudo apt-get -qq upgrade
sudo apt-get -qq autoremove

echo "Installing packages..."

# Install packages (required by ~/.config/i3/config)
sudo apt-get -qq install htop rofi fish ranger nitrogen picom redshift-gtk volumeicon-alsa arandr i3-gaps

# Install other useful packages
sudo apt-get -qq install firefox thunar gedit alacritty

# Install i3 autotiling (.local/bin/autotiling)
sudo apt-get -qq install python3-i3ipc
curl -s -o ~/.local/bin/autotiling -L "https://raw.githubusercontent.com/nwg-piotr/autotiling/master/autotiling/main.py"
sudo chmod +x ~/.local/bin/autotiling

# Install i3status-title-on-bar
curl -s -o ~/.local/bin/i3status-title-on-bar -L "https://github.com/rholder/i3status-title-on-bar/releases/latest/download/i3status-title-on-bar-linux_amd64"
sudo chmod +x ~/.local/bin/i3status-title-on-bar

# Install pfetch (used by ~/.config/fish/config.fish)
curl -s -o ~/.local/bin/pfetch -L "https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch"
sudo chmod +x ~/.local/bin/pfetch

# Install bumblebee-status (for i3 bar)
sudo apt-get -qq install fonts-font-awesome fonts-powerline python3-pip
pip3 install --user --quiet bumblebee-status

# Enable Firewall
echo "Enabling Firewall"
sudo apt-get -qq install gufw
echo "y" | sudo ufw enable

# Wallpaper Setup
echo "Setting up wallpaper for the first time"
nitrogen --save ~/Pictures/Wallpapers/wallpaper.png

echo "Completed!"
