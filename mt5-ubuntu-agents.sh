#!/bin/bash

echo "Starting MetaTrader 5 Strategy Tester Agents..."
export DISPLAY=:0

# Install the agent service on port 2000 with a default password
wine "C:\Program Files\MetaTrader 5\metatester64.exe" /install /address:0.0.0.0:2000 /password:AgentPass123!

# Start the agent engine
wine "C:\Program Files\MetaTrader 5\metatester64.exe" /start

echo "MetaTester Agents are now running in the background."
