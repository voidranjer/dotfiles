# Window and workspace focus rules

# Focus window on hover
focus_follows_mouse yes

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# switch to workspace with urgent window automatically
for_window [urgent=latest] focus

# focus the parent container
bindsym $mod+a focus parent

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8

#navigate workspaces next / previous
# bindsym $mod+Ctrl+Right workspace next
# bindsym $mod+Ctrl+Left workspace prev

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym $mod+minus scratchpad show
bindsym $mod+Shift+minus move scratchpad