#!/bin/bash

# Find the PID of infinite.sh
PID=$(pgrep -f infinite.sh)

# Check if PID is found
if [ -z "$PID" ]; then
    echo "infinite.sh is not running."
else
    kill "$PID"
    echo "Killed infinite.sh with PID $PID."
fi