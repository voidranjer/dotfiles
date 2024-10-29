# Movements of windows

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# Use Mouse+$mod to drag floating windows
floating_modifier $mod

# workspace back and forth (with/without active container)
# workspace_auto_back_and_forth yes
bindsym $mod+b workspace back_and_forth
bindsym $mod+Shift+b move container to workspace back_and_forth; workspace back_and_forth

# move the currently focused window to the scratchpad
# bindsym $mod+Shift+minus move scratchpad

# Move workspaces between monitors
bindsym $mod+Ctrl+Left move workspace to output left
bindsym $mod+Ctrl+Right move workspace to output right
bindsym $mod+Ctrl+Up move workspace to output up
bindsym $mod+Ctrl+Down move workspace to output down
bindsym $mod+Ctrl+h move workspace to output left
bindsym $mod+Ctrl+l move workspace to output right
bindsym $mod+Ctrl+k move workspace to output up
bindsym $mod+Ctrl+j move workspace to output down

# Move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8

# Move to workspace with focused container
bindsym $mod+Ctrl+1 move container to workspace $ws1; workspace $ws1
bindsym $mod+Ctrl+2 move container to workspace $ws2; workspace $ws2
bindsym $mod+Ctrl+3 move container to workspace $ws3; workspace $ws3
bindsym $mod+Ctrl+4 move container to workspace $ws4; workspace $ws4
bindsym $mod+Ctrl+5 move container to workspace $ws5; workspace $ws5
bindsym $mod+Ctrl+6 move container to workspace $ws6; workspace $ws6
bindsym $mod+Ctrl+7 move container to workspace $ws7; workspace $ws7
bindsym $mod+Ctrl+8 move container to workspace $ws8; workspace $ws8