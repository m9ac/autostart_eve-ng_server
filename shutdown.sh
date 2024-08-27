#!/bin/bash

# Log file path
LOG_FILE="/root/log.log"

# Function to log with a timestamp
log_with_timestamp() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Execute the powerdown command via SSH and log the output
ssh idrac "racadm serveraction powerdown" 2>&1 | while IFS= read -r line; do
    log_with_timestamp "$line"
done

# Check if the command was successful
if [ $? -eq 0 ]; then
    log_with_timestamp "EVE-NG PRO is shutting down. Get some rest. Things will go smoother tomorrow. Good night."
else
    log_with_timestamp "Failed to shutdown EVE-NG PRO. Try something else and then go to bed—it's late. You'll see more clearly in the morning."
fi
