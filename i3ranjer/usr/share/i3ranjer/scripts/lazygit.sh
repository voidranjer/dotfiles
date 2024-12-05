#!/bin/bash
set -e

# Define temporary file paths
TEMP_DIR=$(mktemp -d)
LAZYGIT_TAR="$TEMP_DIR/lazygit.tar.gz"
LAZYGIT_BIN="$TEMP_DIR/lazygit"

# Fetch the latest version of lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')

# Download and extract lazygit
curl -Lo "$LAZYGIT_TAR" "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf "$LAZYGIT_TAR" -C "$TEMP_DIR"

# Install lazygit
install "$LAZYGIT_BIN" -D -t /usr/local/bin/

# Clean up
rm -rf "$TEMP_DIR"