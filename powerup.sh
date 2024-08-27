#!/bin/bash

# Log file path
LOG_FILE="/root/log.log"

# Function to log with a timestamp
log_with_timestamp() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Execute the powerup command via SSH and log the output
ssh idrac "racadm serveraction powerup" 2>&1 | while IFS= read -r line; do
    log_with_timestamp "$line"
done

# Check if the command was successful
if [ $? -eq 0 ]; then
    log_with_timestamp "EVE-NG PRO started successfully. Your lab will be readiy in 10 minutes."
else
    log_with_timestamp "Failed to start EVE-NG PRO."
fi
