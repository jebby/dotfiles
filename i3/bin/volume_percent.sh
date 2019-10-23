#!/bin/bash

# Get the current volume using pulseaudio.

# Check if were connected to DUAL BT, if so set the sink appropriately,
# otherwise set the sink to the default
SINK=$(pactl list sinks | grep -B3 "Description: DUAL BT" | grep -oP "Sink #\K(\d+)")
if [ -z $SINK ]; then
	SINK="0"
fi
pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
