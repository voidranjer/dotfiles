#!/bin/bash

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# Clean up
rm lazygit.tar.gz lazygit

# Alias for bash
if ! grep -Fxq "alias lg='lazygit'" ~/.bashrc; then
    echo "alias lg='lazygit'" >> ~/.bashrc
fi

# Alias for fish
mkdir -p ~/.config/fish
touch ~/.config/fish/config.fish
if ! grep -Fxq "alias lg='lazygit'" ~/.config/fish/config.fish; then
    echo "alias lg='lazygit'" >> ~/.config/fish/config.fish
fi