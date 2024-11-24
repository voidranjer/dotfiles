#!/bin/bash

# Check if there are entries in the history (popped notifications disappear from here)
get_history() {
    dunstctl history | grep -q "id"
}

# Nothing found in the history
# Possibility: All notifications are currently on display (popped)
if ! get_history; then
    dunstctl close-all # Close all notifications (return to history stack)
    exit 0
fi

# History stack isn't empty. Pop all notifications (to display them)
while get_history; do
    # Pop the oldest notification in history
    dunstctl history-pop
    # Add a brief delay to avoid overwhelming Dunst
    sleep 0.01
done
