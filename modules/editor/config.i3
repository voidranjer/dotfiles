# Start Emacs daemon
exec --no-startup-id emacs --daemon

# Keybind
bindsym $mod+Shift+Return exec emacsclient -c
