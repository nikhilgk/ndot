#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# # Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# # Launch bar1 and bar2
# #MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)

# #MONITORS=$MONITORS polybar top &
# #MONITOR=$MONITORS polybar bottom;

# polybar mobile;

# echo "Bars launched..."


# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     echo "Launching bar on $m"
#     MONITOR=$m polybar --reload mobile &
#   done
# else
#     echo "Launching bar on"
#   polybar --reload mobile &
# fi
MONITOR=virt-top-left polybar --reload mobile &
MONITOR=virt-bottom-left polybar --reload mobile &
MONITOR=virt-right polybar --reload mobile &
MONITOR=eDP polybar --reload mobile &
# MONITOR=DisplayPort-2 polybar --reload mobile &
MONITOR=DisplayPort-1 polybar --reload mobile &