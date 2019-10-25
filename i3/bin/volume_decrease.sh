#!/bin/bash

# The number of steps to move the volume.
STEP=5

SINK="0"

# Lower the volume by `STEPS` steps.
pactl set-sink-volume $SINK -$STEP%
