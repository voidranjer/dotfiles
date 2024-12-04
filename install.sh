#!/bin/bash

# If one command fails, stop the script
set -e

# Updates
echo "Running apt-get 'update', 'upgrade', and 'autoremove'..."
sudo apt-get -qq update
sudo apt-get -qq upgrade
sudo apt-get -qq autoremove

# Install requirements
echo "Installing python3 and python3-pip..."
sudo apt-get -qq install -y \
    python3 \
    python3-pip

# Install module deps
echo "Installing module dependencies..."
for INSTALL_SCRIPT in ./modules/*/install.sh; do
    if [ -f "$INSTALL_SCRIPT" ]; then
        chmod +x "$INSTALL_SCRIPT"
        "$INSTALL_SCRIPT"
    fi
done

# Execute ./configure.sh
echo "Compiling i3 configurations..."
if [ -f ./configure.sh ]; then
    chmod +x ./configure.sh
    ./configure.sh
fi