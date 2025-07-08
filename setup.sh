#!/usr/bin/env bash

# This script automates the setup of a new development environment,
# including installing necessary tools via Homebrew, setting up
# Tmux plugins, symlinking dotfiles using Stow, and performing
# post-installation tasks.

# --- Configuration Variables ---
DOTFILES_BASE_DIR="${HOME}/dotfiles"          # Base directory where your dotfiles repo is cloned
STOW_PACKAGES_DIR="${DOTFILES_BASE_DIR}/stow" # Directory containing individual Stow packages
BREWFILE_PATH="${DOTFILES_BASE_DIR}/Brewfile" # Path to your Homebrew Brewfile

# --- Helper Functions ---

# Function to display messages
log() {
  echo "" # Add a blank line for readability
  echo "--- $1 ---"
  echo ""
}

# Function to display error messages and exit
error_exit() {
  echo ""
  echo "ERROR: $1" >&2
  echo "Aborting setup."
  echo ""
  exit 1
}

# --- Setup Steps Functions ---

# Checks for required command-line dependencies
check_dependencies() {
  log "Checking for required dependencies..."
  local missing_deps=()

  if ! command -v git &>/dev/null; then
    missing_deps+=("git")
  fi
  if ! command -v stow &>/dev/null; then
    missing_deps+=("stow")
  fi
  # if ! command -v brew &>/dev/null; then
  #   missing_deps+=("brew")
  # fi

  if [ ${#missing_deps[@]} -gt 0 ]; then
    error_exit "The following critical dependencies are missing: ${missing_deps[*]}. Please install them before running this script."
  else
    echo "All critical dependencies found."
  fi
}

# Sets up Tmux Plugin Manager (tpm)
setup_tmux_tpm() {
  log "Setting up Tmux Plugin Manager (tpm)..."
  local tpm_dir="${HOME}/.tmux/plugins/tpm"
  mkdir -p "${HOME}/.tmux/plugins" || error_exit "Failed to create Tmux plugins directory."

  if [ ! -d "${tpm_dir}" ]; then
    echo "Cloning tpm into ${tpm_dir}..."
    git clone https://github.com/tmux-plugins/tpm "${tpm_dir}" || error_exit "Failed to clone tpm."
    echo "tpm cloned successfully."
  else
    echo "tpm is already present."
  fi
}

# Installs packages using Homebrew Bundle
install_brew_packages() {
  # For devcontainer feature: ghcr.io/meaningful-ooo/devcontainer-features/homebrew:2
  # sudo chown -R user /home/linuxbrew/.linuxbrew

  log "Installing packages using Homebrew Bundle..."
  if [ ! -f "${BREWFILE_PATH}" ]; then
    error_exit "Brewfile not found at ${BREWFILE_PATH}. Please ensure it exists."
  fi
  echo "Running 'brew bundle install' using Brewfile: ${BREWFILE_PATH}"
  brew bundle install --file="${BREWFILE_PATH}" || error_exit "Homebrew Bundle installation failed."
  echo "Homebrew packages installed/updated successfully."
}

# A function to install fzf (a command-line fuzzy finder).
#
# This function checks for dependencies (git), and verifies that fzf is not
# already installed before proceeding. It provides detailed feedback to the user
# throughout the process.
install_fzf() {
  # Check if fzf is already installed by checking for the directory.
  if [ -d "$HOME/.fzf" ]; then
    echo "fzf is already installed. Skipping installation."
    return 0 # Exit the function with a success code
  fi

  # Check if git is installed, as it's a dependency for cloning.
  if ! command -v git &>/dev/null; then
    echo "Error: git is not installed. Please install git and try again." >&2
    return 1 # Exit the function with an error code
  fi

  echo "Cloning fzf repository..."
  # We redirect stdout to /dev/null to hide the normal "git clone" output,
  # but we allow stderr to pass through. This way, if there's an error
  # (e.g., network issue, repository not found), the user will see it.
  if git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf" >/dev/null; then
    echo "Clone successful."
    echo "Running fzf install script..."

    # The --all flag will automatically:
    #   - Update your shell configuration files (.bashrc, .zshrc, etc.)
    #   - Set up key bindings (CTRL-T, CTRL-R, ALT-C)
    #   - Set up fuzzy auto-completion
    # This makes the installation non-interactive. If you want the script
    # to ask you questions, remove the '--all' flag.
    "$HOME/.fzf/install" --all

    echo "fzf installation complete. Please restart your shell or source your config file."
  else
    # The error message from git clone will be displayed automatically.
    echo "Clone failed." >&2
    return 1 # Exit with an error code
  fi
}

# Sets up dotfiles symlinks using Stow
symlink_dotfiles() {
  log "Symlinking dotfiles using Stow..."
  if [ ! -d "${STOW_PACKAGES_DIR}" ]; then
    error_exit "Stow packages directory not found at ${STOW_PACKAGES_DIR}. Please check your dotfiles structure."
  fi

  echo "Changing directory to ${STOW_PACKAGES_DIR}..."
  cd "${STOW_PACKAGES_DIR}" || error_exit "Failed to change to Stow packages directory."

  echo "Stowing applications to ${HOME}..."
  # This loop iterates through all directories in the stow directory,
  # treating each as a Stow package and creating symlinks to the home directory.
  for app_dir in */; do
    app_name=$(basename "${app_dir}") # Extract just the directory name
    echo "  -> Stowing: ${app_name}"
    # Using 'stow --restow' to ensure idempotency and re-create symlinks if needed.
    # '--target=${HOME}' specifies the destination root for symlinks.
    stow --adopt --restow --target="${HOME}" "${app_name}" || {
      echo "    Warning: Stow failed for ${app_name}. This might be due to existing files."
      echo "    Consider moving/deleting existing files or using 'stow --adopt' if applicable."
    }
  done
  echo "Dotfiles symlinked successfully (check for warnings above)."
}

# Performs post-installation tasks, like updating bat cache
update_bat_cache() {
  log "Performing post-installation tasks (e.g., updating bat cache)..."
  if command -v bat &>/dev/null; then
    echo "Updating bat theme cache..."
    bat cache --build || echo "Warning: Failed to update bat cache. Please run 'bat cache --build' manually if issues occur."
    echo "Bat cache update initiated."
  else
    echo "Bat is not installed. Skipping bat cache update."
  fi
}

# --- Main Script Execution ---
main() {
  echo "=========================================="
  echo " Dotfiles Setup Script"
  echo "=========================================="

  check_dependencies
  setup_tmux_tpm
  # install_brew_packages
  symlink_dotfiles
  update_bat_cache
  install_fzf

  log "Dotfiles setup completed!"
  echo "Please remember to:"
  echo "  - Start a new shell session (e.g., 'sf' or open a new terminal) for changes to take full effect."
  echo "  - Inside Tmux, press your prefix key (usually Ctrl+b) then 'I' (capital i) to install tpm plugins."
  echo "=========================================="
}

# Execute the main function
main "$@"
