# Start i3bar to display a workspace bar (plus the system information i3status if available)
bar {
	font pango:Inconsolata 10
	position top
	tray_output primary
	status_command bumblebee-status -m cpu \
		memory pasink date time battery \
		-p root.path=/ time.format="%l:%M %p" date.format="%a %d/%m" \
		-t iceberg-rainbow
	# status_command bumblebee-status -m nic disk:root cpu \
	# 	memory apt date time pasink pasource battery \
	# 	-p root.path=/ time.format="%r" date.format="%a, %b %d %Y" \
	# 	-t iceberg-rainbow
}
# bar {
# 	i3bar_command i3bar
# 	font xft:Open Sans Semi-Bold 11
# 	status_command i3status | i3status-title-on-bar --color '$sky-blue'
# 	position top

# ## please set your primary output first. Example: 'xrandr --output eDP1 --primary'
# 	tray_output primary
# #	tray_output eDP1

# 	bindsym button4 nop
# 	bindsym button5 nop
# #   font xft:URWGothic-Book 11
# #	strip_workspace_numbers yes

#     colors {
#         background $term_background
#         statusline $term_foreground
#         separator  $term_color4

# 	#			border			background		text
# 	focused_workspace	$term_background	$term_background	$term_color4
# 	active_workspace	$term_color4		$term_background	$term_foreground
# 	inactive_workspace	$term_background	$term_background	$term_foreground
# 	urgent_workspace	$term_color1		$term_color1		$term_foreground
#     }
# }

# hide/unhide i3status bar
bindsym $mod+m bar mode toggle