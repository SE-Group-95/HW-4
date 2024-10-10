#!/bin/bash
PID=$(pgrep -f infinite.sh) && kill "$PID" && echo "Killed infinite.sh with PID $PID." || echo "infinite.sh is not running."