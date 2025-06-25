# source-fish
# Useful after modifying config files without restarting the terminal.
function sf
    echo "Reloading Fish shell configuration..."
    # Re-executes the current shell process with the same arguments.
    # This effectively restarts the shell, sourcing all config files again.
    # This is the most robust way to ensure all changes are applied.
    exec fish
end
