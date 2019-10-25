#!/bin/sh

# Pulseaudio handles volume going below 0,
# but does not handle volume going above 100
# Be VERY careful setting the upper limit too high.
MAX_VOL=200

# The number of steps to move the volume.
STEP=5
SINK="0"

echo "SINK: $SINK"



# Get the current and target volume.
VOLUME=$(~/.i3/bin/volume_percent.sh)
TARGET=$(( $VOLUME + $STEP ))

# If the current volume is at the upper limit,
# then exit.
if [[ $VOLUME -eq $MAX_VOL ]]; then
	exit 1
fi

# If the target volume is higher than the upper limit,
# then set the volume to the upper limit instead.
# Otherwise, set the volume to the target volume.
if [[ $TARGET -gt $MAX_VOL ]]; then
	pactl set-sink-volume $SINK $MAX_VOL%
else
	pactl set-sink-volume $SINK $TARGET%
fi
