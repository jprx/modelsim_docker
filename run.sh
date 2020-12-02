#!/bin/bash

# Detect OS
if [[ $(uname -s) == *"Darwin"* ]]; then
    echo "Detected macOS, running mac_start.sh"
    echo "Did you remember to enable 'Allow connections from network clients' in XQuartz Preferences->Security and then restart XQuartz?"
    ./mac_start.sh
else
    # Linux, probably
    echo "Detected Linux, running linux_start.sh"
    ./linux_start.sh
fi
