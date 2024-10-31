# Session control

# i3 Hotkeys
bindsym $mod+Shift+q kill
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
bindsym $mod+9 exit
# bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# Set shut down, restart and locking features
bindsym $mod+0 mode "$mode_system"
set $mode_system (l)ock, (e)xit, switch_(u)ser, (s)uspend, (h)ibernate, (r)eboot, (Shift+s)hutdown
mode "$mode_system" {
    bindsym l exec --no-startup-id i3lock, mode "default"
#     bindsym l exec --no-startup-id i3exit lock, mode "default"
    bindsym s exec --no-startup-id systemctl suspend, mode "default"
#    bindsym u exec --no-startup-id i3exit switch_user, mode "default"
    bindsym e exec --no-startup-id i3-msg exit, mode "default"
#    bindsym h exec --no-startup-id i3exit hibernate, mode "default"
    bindsym r exec --no-startup-id i3exit reboot, mode "default"
    bindsym Shift+s exec --no-startup-id shutdown now, mode "default"

    # exit system mode: "Enter" or "Escape"
    bindsym Return mode "default"
    bindsym Escape mode "default"
}