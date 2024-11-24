# Custom Palette
set $color_foreground   #D2D2D2
set $color_background   #383C4A
set $color_red          #5294e2
set $color_gray         #7C818C
set $color_blue	        #5294E2


#						border				background			text				indicator			child_border
client.focused			$color_blue		    $color_blue		    $color_foreground	$color_blue		    $color_blue
client.unfocused		$color_background	$color_background	$color_foreground	$color_background	$color_background
client.focused_inactive	$color_gray			$color_gray			$color_foreground	$color_gray			$color_gray
client.urgent			$color_red		    $color_red		    $color_foreground	$color_red		    $color_red
client.placeholder		$color_blue		    $color_blue		    $color_blue		    $color_blue		    $color_blue

client.background	    $color_background
