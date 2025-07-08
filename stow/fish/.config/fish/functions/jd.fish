# Devcontainer helper function for Fish shell
#
# Usage:
#   jd [command] [workspace_folder] [container_user]
#
# Commands:
#   up      - Starts the devcontainer (default command)
#   build   - Builds the devcontainer
#   exec    - Executes a shell inside the running devcontainer
#   stop    - Stops the devcontainer services
#   down    - Stops and removes the devcontainer containers
#
# Arguments:
#   workspace_folder - The folder containing the .devcontainer configuration (default: .)
#   container_user   - The username inside the container for volume mounts (default: user)

function jd
    # --- Configuration ---
    # Change this to point to your dotfiles repository
    set -l dotfiles_repo "https://github.com/voidranjer/dotfiles.git"

    # Get features from: https://containers.dev/features
    set -l additional_features '{
      "ghcr.io/jmdaly/features/fish:1": {},
      "ghcr.io/jmdaly/features/rust-cli-tools:latest": {},
      "ghcr.io/jmdaly/features/neovim-bin:1": {},
      "ghcr.io/kreemer/features/stow:1": {},
      "ghcr.io/devcontainers/features/node:1": {},
      "ghcr.io/jmdaly/features/difftastic:1": {},
      "ghcr.io/georgofenbeck/features/lazygit-linuxbinary:1": {}
    }'

    # Change this to your preferred shell
    set -l shell fish
    # --- End Configuration ---

    # Set command-line arguments with defaults
    set -l mode $argv[1]
    if test -z "$mode"
        set mode up
    end

    set -l workspace_folder $argv[2]
    if test -z "$workspace_folder"
        set workspace_folder "."
    end

    set -l container_user $argv[3]
    if test -z "$container_user"
        set container_user user
    end

    # Ensure the workspace folder path is absolute for docker-compose
    set -l absolute_workspace_folder (realpath $workspace_folder)

    # Main logic using a switch statement
    switch "$mode"
        case build
            echo "Building devcontainer with workspace folder: $absolute_workspace_folder"
            devcontainer build --no-cache --workspace-folder $absolute_workspace_folder \
                --additional-features "$additional_features"

        case up
            echo "Starting devcontainer with workspace folder: $absolute_workspace_folder"
            # Ensure directories for mounting exist on the host
            mkdir -p "$HOME/devcontainer_data/.tmux"
            mkdir -p "$HOME/devcontainer_data/.local"
            mkdir -p "$HOME/devcontainer_data/.cache"
            mkdir -p "$HOME/.local/state/nvim"

            devcontainer up --workspace-folder $absolute_workspace_folder \
                --dotfiles-repository $dotfiles_repo \
                --additional-features "$additional_features" \
                --mount type=bind,source=$SSH_AUTH_SOCK,target=$SSH_AUTH_SOCK \
                --mount type=bind,source="$HOME/devcontainer_data/.tmux",target="/home/$container_user/.tmux" \
                --mount type=bind,source="$HOME/devcontainer_data/.local",target="/home/$container_user/.local" \
                --mount type=bind,source="$HOME/devcontainer_data/.cache",target="/home/$container_user/.cache" \
                --mount type=bind,source="$HOME/.local/state/nvim",target="/home/$container_user/.local/state/nvim"

        case exec
            devcontainer exec --workspace-folder $absolute_workspace_folder \
                --remote-env TERM=$TERM \
                --remote-env SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
                --remote-env SHELL=$shell \
                $shell

        case stop
            echo "Stopping devcontainer services for: $absolute_workspace_folder"
            set -l compose_file "$absolute_workspace_folder/.devcontainer/compose.yaml"
            set -l override_file "$absolute_workspace_folder/.devcontainer/compose.override.yaml"
            docker compose -f $compose_file -f $override_file down

        case down
            echo "Removing devcontainer for: $absolute_workspace_folder"
            set -l compose_file "$absolute_workspace_folder/.devcontainer/compose.yaml"
            set -l override_file "$absolute_workspace_folder/.devcontainer/compose.override.yaml"
            docker compose -f $compose_file -f $override_file rm -f

        case '*'
            echo "Invalid command: $mode"
            echo "Available commands: up, build, exec, stop, down"
            return 1
    end
end
