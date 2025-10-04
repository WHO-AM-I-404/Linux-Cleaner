#!/bin/bash

export DISPLAY=:100
export QT_QPA_PLATFORM=xcb

rm -rf /tmp/.X100-lock /tmp/.X11-unix/X100 2>/dev/null

Xvnc :100 -geometry 1280x720 -depth 24 -SecurityTypes None -rfbport 6000 &
VNC_PID=$!

sleep 2

if ! ps -p $VNC_PID > /dev/null; then
    echo "ERROR: VNC server failed to start"
    exit 1
fi

echo "VNC server started successfully on :100 (port 6000)"

fluxbox &
sleep 1

echo "Starting Linux Cleaner..."
./linux-cleaner 2>&1

wait
