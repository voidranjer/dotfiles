# i3 config file (v4)
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

################################################################################################
# DEPENDENCIES (Not automatically installed by ~/ubuntu-post-installer.sh)
################################################################################################
# nm-applet             - Description
# blueman-applet        - Description
# xfce4-power-manager   - Description
# Everything else listed in the "CONFIG CONSTANTS" section

################################################################################################
# NOT IN CONFIG [dependent on DE - (Zorin OS, XFCE)]
################################################################################################
# This config assumes that XFCE is also installed and configured
# 1) Notifications
# 2) Policy Kit
# 2) Power Management
# 3) Network Manager
# 4) Volume Icon
# 5) Screen Brightness
# 6) Screen Lock
# 7) Screen Saver
# 8) Wallpaper
# 9) Compositor
# 10) Autostart
# 11) Sound
# 12) Display Configurations
# 13) Keyboard Layout

################################################################################################
# CONFIG CONSTANTS
################################################################################################
# Set mod key (Mod1=<Alt>, Mod4=<Super>)
set $mod Mod4
set $TERMINAL alacritty
set $BROWSER firefox
set $EDITOR code
set $SCREENSHOT gnome-screenshot
set $FILEMANAGER $TERMINAL ranger
# set $FILEMANAGER pcmanfm # Note: There is a line below that executes this command: 'exec --no-startup-id pcmanfm -d'
# set $PACKAGEMAN pamac-manager

################################################################################################
# GENERAL
################################################################################################
# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font xft:Open Sans Semi-Bold 11

# Launch Program Hotkeys
# bindsym $mod+9 exec --no-startup-id blurlock
# bindsym $mod+Shift+h exec xdg-open /usr/share/doc/manjaro/i3_help.pdf
# bindsym $mod+z exec --no-startup-id morc_menu
# bindsym $mod+p exec $PACKAGEMAN
# bindsym $mod+Ctrl+b exec $TERMINAL -e 'bmenu'
# bindsym $mod+Shift+f exec pcmanfm_pkexec
# bindsym $mod+F5 exec $TERMINAL -e 'mocp'
# bindsym $mod+Shift+D alacarte
# bindsym $mod+x exec $TERMINAL -e htop
# bindsym $mod+Shift+w exec $BROWSER -private-window # Only works with Firefox
# bindsym $mod+f exec $FILEMANAGER
bindsym $mod+Return exec $TERMINAL
bindsym $mod+w exec $BROWSER
bindsym $mod+f exec $FILEMANAGER
bindsym $mod+e exec $EDITOR
# bindsym $mod+Shift+d --release exec killall dunst; exec notify-send 'restart dunst'
bindsym $mod+Ctrl+x --release exec --no-startup-id xkill
# bindsym $mod+d exec "rofi -show drun -modi drun,find:~/.local/share/rofi/finder.sh,window,run,ssh -show-icons -sidebar-mode"
bindsym $mod+d exec "rofi -show window -modi drun,window,run,ssh"
bindsym $mod+Shift+d exec "rofi -show drun -modi drun,window,run,ssh"
# bindsym $mod+Shift+d exec "rofi-theme-selector"
bindsym $mod+F10 exec $EDITOR ~/.config/i3/config
################################################################################################
# GENERAL
################################################################################################


################################################################################################
# AUTOSTART
################################################################################################

# iBus Daemon autostart [https://wiki.archlinux.org/title/IBus]
# Execute 'ibus-setup' to configure iBus with a graphical interface
# exec --no-startup-id ibus-daemon -drxR

## Clipboard Manager
# exec --no-startup-id clipit -dn

## System Tray Applets
# exec --no-startup-id nm-applet
# exec --no-startup-id blueman-applet
# exec --no-startup-id pamac-tray
# exec --no-startup-id xfce4-power-manager

## Manjaro Implemented
# exec_always --no-startup-id ff-theme-util
# exec_always --no-startup-id fix_xcursor

## Launch PCManFM daemon as volume manager
# exec --no-startup-id pcmanfm -d

## Auto-activate numlock on login
# exec_always --no-startup-id numlockx

## Autostart User Applications
# exec --no-startup-id redshift-gtk

## Disabled
# exec --no-startup-id barrier
# exec --no-startup-id xautolock -time 10 -locker blurlock # Using XFCE's Power Manager (and automatic screensaver)
# exec --no-startup-id manjaro-hello
# exec_always --no-startup-id sbxkb
# exec --no-startup-id start_conky_maia
# exec --no-startup-id start_conky_green
################################################################################################
# AUTOSTART
################################################################################################
