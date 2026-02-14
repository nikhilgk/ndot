#!/bin/bash

# Get the microphone volume and mute state for the "Capture" control
mic_info=$(amixer get Capture)

# Check if the mic is muted
if echo "$mic_info" | grep -q '\[off\]'; then
    echo "🔇 Muted"
else
    # Get the volume percentage
    mic_vol=$(echo "$mic_info" | grep -o -E '[0-9]+%' | head -1)
    echo " $mic_vol"
fi