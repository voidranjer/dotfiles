# Docs: https://dev.to/dianjuar/i3wm-screenshot-shortcuts-3n7b

exec --no-startup-id copyq

# For Wayland (requires grim, slurp, and wl-clipboard to be installed)
# bindsym $mod+p exec grim -g "$(slurp -d)" - | wl-copy

##  Screenshots in files
# bindsym Print exec --no-startup-id maim --format=png "/home/$USER/Pictures/screenshot-$(date -u +'%Y%m%d-%H%M%SZ')-all.png"
bindsym $mod+Print exec --no-startup-id maim --format=png "/home/$USER/Pictures/screenshot-$(date -u +'%Y%m%d-%H%M%SZ')-all.png"
# bindsym $mod+Print exec --no-startup-id maim --format=png --window $(xdotool getactivewindow) "/home/$USER/Pictures/screenshot-$(date -u +'%Y%m%d-%H%M%SZ')-current.png"
# bindsym Shift+Print exec --no-startup-id maim --format=png --select "/home/$USER/Pictures/screenshot-$(date -u +'%Y%m%d-%H%M%SZ')-selected.png"

## Screenshots in clipboards
# bindsym Ctrl+Print exec --no-startup-id maim --format=png | xclip -selection clipboard -t image/png
# bindsym Ctrl+$mod+Print exec --no-startup-id maim --format=png --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png
# bindsym Ctrl+Shift+Print exec --no-startup-id maim --format=png --select | xclip -selection clipboard -t image/png
bindsym Print exec --no-startup-id maim --format=png --select | xclip -selection clipboard -t image/png