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
#   jd down         # Stops and removes the container, network, and volumes

function jd
    # --- Configuration ---
    # Set default values for arguments
    #
    # (Correction) Use a clearer `if` block for parsing arguments.
    # This is more readable and less prone to errors than the 'and/or' chain.
    set -l mode up
    if test (count $argv) -gt 0
        set mode $argv[1]
    end

    set -l workspace_folder "."
    if test (count $argv) -gt 1
        set workspace_folder $argv[2]
    end

    set -l container_user user
    if test (count $argv) -gt 2
        set container_user $argv[3]
    end

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
    function _jd_build
        set -l ws_folder $argv[1]
        echo "Building devcontainer in: $ws_folder"
        devcontainer build --no-cache --workspace-folder $ws_folder \
            --additional-features "$additional_features"
    end

    # Starts and runs the devcontainer
    function _jd_up
        set -l ws_folder $argv[1]
        set -l cont_user $argv[2]
        echo "Starting devcontainer in: $ws_folder"
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
    function _jd_exec
        set -l ws_folder $argv[1]
        echo "Executing shell in: $ws_folder"
        devcontainer exec --workspace-folder $ws_folder \
            --remote-env TERM=$TERM \
            --remote-env SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
            --remote-env SHELL=$shell \
            $shell
    end

    # (Correction) Stops the services without removing them.
    # This now correctly uses 'docker compose stop'.
    function _jd_stop
        set -l ws_folder $argv[1]
        echo "Stopping services in: $ws_folder"
        # The devcontainer CLI does not have a 'stop' command, so we find the
        # compose files and use 'docker compose' directly.
        set -l compose_config (devcontainer read-configuration --workspace-folder $ws_folder --include-merged-configuration | jq -r '.mergedConfiguration.dockerComposeFile | if type == "array" then .[] else . end')
        if test -z "$compose_config"
            echo "Error: Could not find docker-compose file configuration."
            return 1
        end

        set -l compose_files
        for file in $compose_config
            set -a compose_files -f (realpath (dirname $ws_folder/.devcontainer/devcontainer.json)/$file)
        end

        docker compose $compose_files stop
    end

    # (Correction) Stops and removes the devcontainer services, network, etc.
    # This now correctly uses the 'devcontainer down' command.
    function _jd_down
        set -l ws_folder $argv[1]
        echo "Tearing down devcontainer in: $ws_folder"
        devcontainer down --workspace-folder $ws_folder
    end

    # --- Main Logic ---
    # Use a switch statement for command routing
    switch $mode
        case up
            _jd_up $workspace_folder $container_user
        case build
            _jd_build $workspace_folder
        case exec
            _jd_exec $workspace_folder
        case stop
            _jd_stop $workspace_folder
        case down
            _jd_down $workspace_folder
        case '*' # Default case for invalid commands
            echo "Invalid command: '$mode'"
            echo "Usage: jd [up|build|exec|stop|down] [workspace_folder] [container_user]"
            return 1
    end
end
