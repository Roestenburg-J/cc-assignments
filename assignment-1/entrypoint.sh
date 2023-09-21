#!/bin/sh

log_file="../assignment/log.txt"

# Function to log errors
log_error() {
  echo "Error: $1" >> "$log_file"
}

# Execute the curl command
# curl_output=$(curl -X 'POST' \
#   'http://notifications-service:3000/api/notify' \
#   -H 'accept: text/plain; charset=utf-8' \
#   -H 'Content-Type: application/json; charset=utf-8' \
#   -d '{
#       "notification_type": "OutOfRange",
#       "researcher": "d.landau@uu.nl",
#       "measurement_id": "1234",
#       "experiment_id": "5678",
#       "cipher_data": "D5qnEHeIrTYmLwYX.hSZNb3xxQ9MtGhRP7E52yv2seWo4tUxYe28ATJVHUi0J++SFyfq5LQc0sTmiS4ILiM0/YsPHgp5fQKuRuuHLSyLA1WR9YIRS6nYrokZ68u4OLC4j26JW/QpiGmAydGKPIvV2ImD8t1NOUrejbnp/cmbMDUKO1hbXGPfD7oTvvk6JQVBAxSPVB96jDv7C4sGTmuEDZPoIpojcTBFP2xA"
#   }')


# # Check the exit status of the curl command
# if [ $? -ne 0 ]; then
#   log_error "Failed to execute curl command"
# else
#   # Append the output of curl to the log file
#   echo "$curl_output" >> "$log_file"
# fi

# Name of the network to check
network_name="assignment-1-network"

# Use docker network inspect to get information about the network
network_info=$(docker network inspect "$network_name" 2>&1)

# Check if there was an error while inspecting the network
if [ $? -ne 0 ]; then
  log_error "Failed to inspect network $network_name"
else
  # Extract container IDs from the network information
  container_ids=$(echo "$network_info" | jq -r '.[0].Containers | keys[]')

  if [ -z "$container_ids" ]; then
    log_message "No containers found in network $network_name"
  else
    log_message "Containers in network $network_name:"
    for container_id in $container_ids; do
      log_message "- $container_id"
    done
  fi
fi

exit 0
