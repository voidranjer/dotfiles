set $WALLPAPER_PATH ~/Pictures/Wallpapers/wallpaper.png

exec_always --no-startup-id nitrogen --restore; sleep 1; picom -b -C
# exec_always --no-startup-id nitrogen --set-zoom-fill $WALLPAPER_PATH; sleep 1; picom -b -C