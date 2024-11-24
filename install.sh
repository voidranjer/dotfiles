#!/bin/bash

MIN_UBUNTU_VERSION="20.24"

# Check distro
if ! [ -f /etc/lsb-release ]; then
    echo "This script is intended for Ubuntu only."
    exit 1
fi
. /etc/lsb-release
if [ "$DISTRIB_ID" != "Ubuntu" ]; then
    echo "This script is intended for Ubuntu only."
    exit 1
fi

# Check version
if ! [[ "$(echo -e "$MIN_UBUNTU_VERSION\n$DISTRIB_RELEASE" | sort -V | head -n1)" == "$MIN_UBUNTU_VERSION" ]]; then
    echo "This script is intended for Ubuntu $MIN_UBUNTU_VERSION or later."
    exit 1
fi

# Updates
sudo apt update

# Install requirements
sudo apt install -y \
    python3 \
    python3-pip

# Install module deps
for INSTALL_SCRIPT in ./modules/*/install.sh; do
    if [ -f "$INSTALL_SCRIPT" ]; then
        chmod +x "$INSTALL_SCRIPT"
        "$INSTALL_SCRIPT"
    fi
done

if [[ "$(basename "$SHELL_SCRIPT")" == "install.sh" ]]; then
# Execute the installer script
chmod +x "$SHELL_SCRIPT"
"$SHELL_SCRIPT"

# Install dotfiles configuration
chmod +x ./configure.sh
./configure.sh


# TODO: config files (e.g. Rofi theme etc)

# #!/bin/bash

# # Function to get the Ubuntu version
# get_ubuntu_version() {
#     # Retrieve the version ID from /etc/os-release
#     VERSION=$(grep '^VERSION_ID=' /etc/os-release | cut -d '"' -f 2)
#     echo "$VERSION"
# }

# # Function to check if a package is installed
# is_installed() {
#     dpkg -l "$1" &> /dev/null
# }

# # Function to install a package if not installed
# install_package() {
#     if ! is_installed "$1"; then
#         echo "Installing $1..."
#         sudo apt-get install -y "$1"
#         if [ $? -ne 0 ]; then
#             echo "Error: Failed to install $1."
#             exit 1
#         fi
#     else
#         echo "$1 is already installed."
#     fi
# }

# # Define package lists based on Ubuntu version
# install_dependencies() {
#     local version="$1"

#     # Define default dependencies for newer versions (e.g., 20.04 and above)
#     if (( $(echo "$version >= 20.04" | bc -l) )); then
#         PACKAGES=("curl" "wget" "lsb-release")
#     else
#         # Define alternative dependencies for older versions
#         PACKAGES=("curl" "software-properties-common")
        
#         # Add any PPAs needed for older versions here
#         echo "Adding necessary PPAs for Ubuntu $version..."
#         sudo add-apt-repository -y ppa:deadsnakes/ppa # Example for Python on older versions
#         sudo apt-get update
#     fi
# }

# # Run the main installation process
# main() {
#     # Update the package list
#     sudo apt-get update

#     # Check the Ubuntu version
#     UBUNTU_VERSION=$(get_ubuntu_version)
#     echo "Detected Ubuntu version: $UBUNTU_VERSION"

#     # Install dependencies based on version
#     install_dependencies "$UBUNTU_VERSION"

#     # Install each required package
#     for PACKAGE in "${PACKAGES[@]}"; do
#         install_package "$PACKAGE"
#     done

#     echo "All dependencies installed successfully."
# }

# # Start the script
# main
