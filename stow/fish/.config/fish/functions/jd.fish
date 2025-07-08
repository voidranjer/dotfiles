# Devcontainer management function for Fish shell
#
# Usage:
#   jd [up|build|exec|stop|down] [workspace_folder] [container_user]
#
# Examples:
#   jd up . myuser  # Starts the devcontainer in the current directory for 'myuser'
#   jd build        # Rebuilds the devcontainer
#   jd exec         # Opens a shell in the running container
#   jd stop         # Stops the container services
#   jd down         # Stops and removes the container services

function jd
    # --- Configuration ---
    # Set default values for arguments
    set -l mode (count $argv > 0 and echo $argv[1] or echo "up")
    set -l workspace_folder (count $argv > 1 and echo $argv[2] or echo ".")
    set -l container_user (count $argv > 2 and echo $argv[3] or echo "user")

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

    # --- Helper Functions ---

    # Builds the devcontainer image
    function build_devcontainer
        set -l ws_folder $argv[1]
        echo "Building devcontainer with workspace folder: $ws_folder"
        devcontainer build --no-cache --workspace-folder $ws_folder \
            --additional-features "$additional_features"
    end

    # Starts and runs the devcontainer
    function start_devcontainer
        set -l ws_folder $argv[1]
        set -l cont_user $argv[2]
        echo "Starting devcontainer with workspace folder: $ws_folder"
        devcontainer up --workspace-folder $ws_folder \
            --dotfiles-repository $dotfiles_repo \
            --additional-features "$additional_features" \
            --mount type=bind,source=$SSH_AUTH_SOCK,target=$SSH_AUTH_SOCK \
            --mount type=bind,source=$HOME/devcontainer_data/.tmux,target=/home/$cont_user/.tmux \
            --mount type=bind,source=$HOME/devcontainer_data/.local,target=/home/$cont_user/.local \
            --mount type=bind,source=$HOME/devcontainer_data/.cache,target=/home/$cont_user/.cache \
            --mount type=bind,source=$HOME/.local/state/nvim,target=/home/$cont_user/.local/state/nvim
    end

    # Executes a command or opens a shell inside the container
    function exec_devcontainer
        set -l ws_folder $argv[1]
        devcontainer exec --workspace-folder $ws_folder \
            --remote-env TERM=$TERM \
            --remote-env SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
            --remote-env SHELL=$shell \
            $shell
    end

    # Stops the docker compose services
    function stop_devcontainer
        set -l ws_folder $argv[1]
        # Use (command) for command substitution in fish
        set -l compose_file (readlink -f $ws_folder)/.devcontainer/compose.yaml
        set -l override_file (readlink -f $ws_folder)/.devcontainer/compose.override.yaml
        docker compose -f $compose_file -f $override_file down
    end

    # Stops and removes the docker compose services
    function remove_devcontainer
        set -l ws_folder $argv[1]
        set -l compose_file (readlink -f $ws_folder)/.devcontainer/compose.yaml
        set -l override_file (readlink -f $ws_folder)/.devcontainer/compose.override.yaml
        docker compose -f $compose_file -f $override_file rm
    end

    # --- Main Logic ---
    # Use a switch statement for command routing
    switch $mode
        case up
            start_devcontainer $workspace_folder $container_user
        case build
            build_devcontainer $workspace_folder
        case exec
            exec_devcontainer $workspace_folder
        case stop
            stop_devcontainer $workspace_folder
        case down
            remove_devcontainer $workspace_folder
        case '*' # Default case for invalid commands
            echo "Invalid command: $mode"
            return 1
    end
end

# To make this function available in your shell, save it as a file named
# 'dc.fish' in your ~/.config/fish/functions/ directory.
# Then you can run it by simply typing 'dc' in your terminal.
