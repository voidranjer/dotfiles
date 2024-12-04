#!/bin/bash

# Enable Firewall
echo "Enabling Firewall..."
sudo apt-get -qq install gufw
echo "y" | sudo ufw enable