#!/bin/bash

echo "Downloading MetaTrader 5 Official Installer..."
wget -q -O mt5setup.exe "https://download.mql5.com/cdn/web/metaquotes.software.corp/mt5/mt5setup.exe"

echo "Starting temporary virtual display for Wine installation..."
Xvfb :99 -screen 0 1024x768x16 &
XVFB_PID=$!
export DISPLAY=:99

echo "Installing MT5 headlessly (this takes a moment)..."
# The /auto flag tells MT5 to install without clicking "Next"
wine mt5setup.exe /auto

echo "Waiting for Wine environment to write files..."
sleep 30
wineserver -w

echo "Cleaning up installer files..."
kill $XVFB_PID
rm mt5setup.exe

echo "Environment Setup Complete!"
