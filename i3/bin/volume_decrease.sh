#!/bin/bash

# The number of steps to move the volume.
STEP=5

SINK=$(pactl list sinks | grep -B3 "Description: DUAL BT" | grep -oP "Sink #\K(\d+)")
if [ -z $SINK ]; then
	SINK="0"
fi

echo "SINK $SINK"

# Lower the volume by `STEPS` steps.
pactl set-sink-volume $SINK -$STEP%
