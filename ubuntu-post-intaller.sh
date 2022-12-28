#!/bin/bash

# Functions
spin(){
  while [ 1 ]
  do 
    for i in ${spinner[@]}; 
    do 
      echo -ne "\r$i";
      sleep 0.2;
    done;
  done
}

# Spinner animation
spinner=( Ooooo oOooo ooOoo oooOo ooooO oooOo ooOoo oOooo);

# Add PPAs
echo "Adding additional PPAs"
spin &
pid=$!
yes "" | sudo add-apt-repository ppa:regolith-linux/release > /dev/null # i3-gaps
yes "" | sudo add-apt-repository ppa:aslatter/ppa > /dev/null # alacritty
kill $pid 

# Updates
echo "Running `apt update` and `apt upgrade`"
spin &
pid=$!
sudo apt -y update && sudo apt -y upgrade > /dev/null
kill $pid 

echo "Installing packages"
spin &
pid=$!

# Install packages (required by ~/.config/i3/config)
sudo apt -y install htop rofi fish ranger nitrogen picom redshift-gtk volumeicon-alsa arandr i3-gaps > /dev/null

# Install other useful packages
sudo apt -y install firefox thunar gedit alacritty vscode > /dev/null

# Install i3 autotiling (.local/bin/autotiling)
sudo apt -y install python3-i3ipc > /dev/null
curl -o ~/.local/bin/autotiling -L "https://raw.githubusercontent.com/nwg-piotr/autotiling/master/autotiling/main.py" > /dev/null
sudo chmod +x ~/.local/bin/autotiling

# Install i3status-title-on-bar
curl -o ~/.local/bin/i3status-title-on-bar -L "https://github.com/rholder/i3status-title-on-bar/releases/latest/download/i3status-title-on-bar-linux_amd64" > /dev/null
sudo chmod +x ~/.local/bin/i3status-title-on-bar

# Install pfetch (used by ~/.config/fish/config.fish)
curl -o ~/.local/bin/pfetch -L "https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch" > /dev/null
sudo chmod +x ~/.local/bin/pfetch

# Install bumblebee-status (for i3 bar)
sudo apt -y install fonts-font-awesome fonts-powerline python3-pip
pip3 install --user bumblebee-status

kill $pid

# Enable Firewall
echo "Enabling Firewall"
sudo apt -y install gufw
echo "y" | sudo ufw enable

# Wallpaper Setup
echo "Setting up wallpaper for the first time"
nitrogen --save ~/Pictures/Wallpapers/wallpaper.png

echo "Completed!"
