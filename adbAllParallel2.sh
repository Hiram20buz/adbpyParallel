#!/bin/bash

# Function to execute swipe command on a single device
function swipe_on_device() {
    local device="$1"
    local start_x="$2"
    local start_y="$3"
    local end_x="$4"
    local end_y="$5"

    for ((i=0; i<5; i++))
    do
        adb -s $device $start_x $start_y $end_x $end_y
    done
}

# Get a list of connected devices
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

# Iterate through the list of devices and execute swipe commands concurrently
for device in $devices
do
    swipe_on_device "$device" "$start_x" "$start_y" "$end_x" "$end_y" &
done

# Wait for all background jobs to finish
wait
