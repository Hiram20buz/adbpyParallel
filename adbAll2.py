#!/bin/bash

# Get a list of connected devices
# bash a.sh shell input keyevent 24
devices=$(adb devices | grep -v "List of devices attached" | cut -f 1)

# Check if the number of arguments is correct
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <start_x> <start_y> <end_x> <end_y>"
    exit 1
fi

# Extract the coordinates from command-line arguments
start_x=$1
start_y=$2
end_x=$3
end_y=$4

# Iterate through the list of devices and execute the swipe command with the provided coordinates
for device in $devices
do
    for ((i=0; i<=5; i++))
    do
        adb -s $device $start_x $start_y $end_x $end_y
    done
done

