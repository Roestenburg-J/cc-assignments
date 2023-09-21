#!/bin/sh

log_file="../assignment/log.txt"

# Function to log errors
log_error() {
  echo "Error: $1" >> "$log_file"
}

# Execute a Docker command to list networks
docker network ls > "$log_file" 2>&1

# Check if there is any output in the log file
if [ -s "$log_file" ]; then
  echo "Successfully listed Docker networks."
else
  log_error "Failed to list Docker networks."
fi

exit 0

