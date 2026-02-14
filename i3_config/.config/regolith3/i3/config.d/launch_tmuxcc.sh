#!/bin/bash

# Try to find and focus by class (exact match usually required for class)
if xdotool search --class "tmuxcc" windowactivate %@ > /dev/null 2>&1; then
    exit 0
fi

# Try to find and focus by title (exact match)
if xdotool search --name "^tmuxcc$" windowactivate %@ > /dev/null 2>&1; then
    exit 0
fi

# Launch if not found
# Note: gnome-terminal might ignore --class depending on version/environment, 
# so we also set --title to help matching.
gnome-terminal --class="tmuxcc" --title="tmuxcc" --zoom=0.8 -- zsh -c '/home/nikhil/.cargo/bin/tmuxcc'
