#!/bin/bash
# Start VNC server for Linux Cleaner GUI

# Kill any existing VNC servers
vncserver -kill :1 2>/dev/null || true
rm -rf /tmp/.X*-lock /tmp/.X11-unix 2>/dev/null || true

# Start Xvnc server
Xvnc :1 -geometry 1024x768 -depth 24 -rfbport 5900 -SecurityTypes None &
sleep 2

# Set display
export DISPLAY=:1

# Start window manager
fluxbox &
sleep 1

# Start Linux Cleaner
cd /home/runner/workspace
./linux-cleaner
