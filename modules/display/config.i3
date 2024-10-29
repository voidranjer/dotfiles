# Monitor Setup (xrandr + arandr OR wdisplay (Wayland) to set layouts and Primary Monitor)

set $DISPLAY_SCRIPT ~/.screenlayout/layout.sh

bindsym --locked XF86MonBrightnessUp exec brightnessctl s +5%
bindsym --locked XF86MonBrightnessDown exec brightnessctl s 5%- 

# exec_always --no-startup-id $DISPLAY

# Screen brightness controls (Unnecessary when using xfce4-power-manager)
# bindsym XF86MonBrightnessUp exec "xbacklight -inc 10; notify-send 'brightness up'"
# bindsym XF86MonBrightnessDown exec "xbacklight -dec 10; notify-send 'brightness down'"

# Sreen brightness controls
# bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness
# bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness

# Clamshell mode
set $laptop eDP-1
bindswitch --reload --locked lid:on output $laptop disable
bindswitch --reload --locked lid:off output $laptop enable