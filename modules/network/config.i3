# bindsym $mod+F2 exec nmtui

for_window [class="Nm-connection-editor"] floating enable

# exec --no-startup-id nm-applet 
exec --no-startup-id dbus-launch nm-applet 