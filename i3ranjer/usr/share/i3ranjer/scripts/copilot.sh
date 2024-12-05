#!/bin/bash

# If one command fails, stop the script
set -e

# Install Copilot
echo "Installing Copilot..."
(type -p wget >/dev/null || (apt-get -qq update && apt-get install wget -y)) \
    && mkdir -p -m 755 /etc/apt/keyrings \
    && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get -qq update \
    && apt-get -qq install gh -y

# Login to GitHub and install Copilot
echo "Logging into GitHub..."
sensible-terminal -e 'gh auth login'

# Prompt the user to press Enter after completing the login
read -p "Press Enter after you have completed the GitHub login..."

# Install GitHub Copilot extension
gh extension install github/gh-copilot