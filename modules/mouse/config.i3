mode "mouse" {

	# set your three speeds here

	set $slow 10
	set $quick 20
	set $fast 50

	# Mouse movement (fast)
	bindsym h exec xdotool mousemove_relative -- -$fast 0
	bindsym j exec xdotool mousemove_relative 0 $fast
	bindsym k exec xdotool mousemove_relative -- 0 -$fast
	bindsym l exec xdotool mousemove_relative $fast 0
	bindsym Left exec xdotool mousemove_relative -- -$fast 0
	bindsym Down exec xdotool mousemove_relative 0 $fast
	bindsym Up exec xdotool mousemove_relative -- 0 -$fast
	bindsym Right exec xdotool mousemove_relative $fast 0

	# Mouse movement (quicker)
	bindsym Shift+h exec xdotool mousemove_relative -- -$quick 0
	bindsym Shift+j exec xdotool mousemove_relative 0 $quick
	bindsym Shift+k exec xdotool mousemove_relative -- 0 -$quick
	bindsym Shift+l exec xdotool mousemove_relative $quick 0
	bindsym Shift+Left exec xdotool mousemove_relative -- -$quick 0
	bindsym Shift+Down exec xdotool mousemove_relative 0 $quick
	bindsym Shift+Up exec xdotool mousemove_relative -- 0 -$quick
	bindsym Shift+Right exec xdotool mousemove_relative $quick 0

	# Mouse movement (slow/fine-tuned)
	bindsym Shift+Ctrl+h exec xdotool mousemove_relative -- -$slow 0
	bindsym Shift+Ctrl+j exec xdotool mousemove_relative 0 $slow
	bindsym Shift+Ctrl+k exec xdotool mousemove_relative -- 0 -$slow
	bindsym Shift+Ctrl+l exec xdotool mousemove_relative $slow 0
	bindsym Shift+Ctrl+Left exec xdotool mousemove_relative -- -$slow 0
	bindsym Shift+Ctrl+Down exec xdotool mousemove_relative 0 $slow
	bindsym Shift+Ctrl+Up exec xdotool mousemove_relative -- 0 -$slow
	bindsym Shift+Ctrl+Right exec xdotool mousemove_relative $slow 0

	# Left Click
	bindsym f exec xdotool click 1

	# Middle Click
	bindsym d exec xdotool click 2

	# Right Click
	bindsym s exec xdotool click 3

	# Left Click-and-drag
	bindsym Shift+f exec xdotool mousedown 1;

	# Middle Click-and-drag 
	bindsym Shift+d exec xdotool mousedown 2

	# Right Click-and-drag
	bindsym Shift+s exec xdotool mousedown 3

	# Left Drag release
	bindsym Ctrl+f exec xdotool mouseup 1

	# Middle Drag release
	bindsym Ctrl+d exec xdotool mouseup 2

	# Right Drag release
	bindsym Ctrl+s exec xdotool mouseup 3


	# return to normal keybindings -- IMPORTANT!!
	bindsym Escape mode "default"
}

bindsym $mod+Shift+m mode "mouse"