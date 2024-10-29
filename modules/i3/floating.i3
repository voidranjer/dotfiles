# On X11/Xorg, use `xprop | grep WM_CLASS` to get class name

# Open applications on specific workspaces
# assign [class="Thunderbird"] $ws1

# Define windowing style for specific windows <floating|fullscreen|border|sticky>
for_window [title="alsamixer"] floating enable
for_window [class="Clipgrab"] floating enable
for_window [title="File Transfer*"] floating enable
for_window [class="fpakman"] floating enable
for_window [class="Galculator"] floating enable
for_window [class="GParted"] floating enable
for_window [title="i3_help"] floating enable
for_window [class="Lightdm-settings"] floating enable
for_window [class="Lxappearance"] floating enable
for_window [class="Manjaro-hello"] floating enable
for_window [class="Manjaro Settings Manager"] floating enable
for_window [title="MuseScore: Play Panel"] floating enable
for_window [class="Nitrogen"] floating enable
for_window [class="Oblogout"] fullscreen enable
for_window [class="octopi"] floating enable
for_window [title="About Pale Moon"] floating enable
for_window [class="Pamac-manager"] floating enable
for_window [class="Pavucontrol"] floating enable
for_window [class="qt5ct"] floating enable
for_window [class="Qtconfig-qt4"] floating enable sticky enable
for_window [class="Simple-scan"] floating enable
for_window [class="(?i)System-config-printer.py"] floating enable
for_window [class="Skype"] floating enable
for_window [class="Timeset-gui"] floating enable
for_window [class="(?i)virtualbox"] floating enable
for_window [class="Xfburn"] floating enable
for_window [class="Popsicle"] floating enable
for_window [class="Arandr"] floating enable