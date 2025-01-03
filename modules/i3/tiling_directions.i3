# Hotkeys for tiling direction

# split orientation
bindsym $mod+c split h;exec notify-send 'tile horizontally'
bindsym $mod+v split v;exec notify-send 'tile vertically'
bindsym $mod+q split toggle

# change container layout (fullscreen toggle global: Span all available outputs)
bindsym $mod+o layout stacking
bindsym $mod+u layout tabbed
bindsym $mod+i layout toggle split
bindsym $mod+F11 fullscreen toggle
bindsym $mod+Shift+F11 fullscreen toggle global

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# toggle sticky (Show on all workspaces)
bindsym $mod+Shift+s sticky toggle

# set default desktop layout (default is tiling)
# workspace_layout tabbed <stacking|tabbed>
