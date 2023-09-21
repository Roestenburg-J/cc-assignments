#!/bin/sh

log_file="../assignment/log.txt"

# Function to log errors
log_error() {
  echo "Error: $1" >> "$log_file"
}

# Function to log messages
log_message() {
  echo "$1" >> "$log_file"
}

# Execute the curl command, capturing both stdout and stderr
curl_output=$(curl -X 'POST' \
  'http://notifications-service:3000/api/notify' \
  -H 'accept: text/plain; charset=utf-8' \
  -H 'Content-Type: application/json; charset=utf-8' \
  -d '{
      "notification_type": "OutOfRange",
      "researcher": "d.landau@uu.nl",
      "measurement_id": "1234",
      "experiment_id": "5678",
      "cipher_data": "D5qnEHeIrTYmLwYX.hSZNb3xxQ9MtGhRP7E52yv2seWo4tUxYe28ATJVHUi0J++SFyfq5LQc0sTmiS4ILiM0/YsPHgp5fQKuRuuHLSyLA1WR9YIRS6nYrokZ68u4OLC4j26JW/QpiGmAydGKPIvV2ImD8t1NOUrejbnp/cmbMDUKO1hbXGPfD7oTvvk6JQVBAxSPVB96jDv7C4sGTmuEDZPoIpojcTBFP2xA"
  }' 2>&1)  # Capture both stdout and stderr

# Check the exit status of the curl command
if [ $? -ne 0 ]; then
  log_error "Failed to execute curl command"
else
  # Append the output (stdout and stderr) of curl to the log file
  log_message "$curl_output"
fi

exit 0
