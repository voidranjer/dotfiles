#!/bin/bash

# If one command fails, stop the script
set -e


# Execute ./configure.sh
echo "Compiling i3 configurations..."
if [ -f ./configure.sh ]; then
    chmod +x ./configure.sh
    ./configure.sh
fi