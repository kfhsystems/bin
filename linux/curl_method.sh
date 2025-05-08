#!/bin/bash

# URL of the Ansible Automation Platform controller
CONTROLLER_URL="https://controller.karshi.ca"

# Check the status of the controller every 5 seconds
while true; do
    # Use curl to check if the service is available
    # Using the `-k` option allows `curl` to skip SSL verification, which should help you 
    # bypass the issue of an unrecognized or self-signed SSL certificate. 
    # The command you provided will check the HTTP status code while ignoring any SSL certificate errors. 
    RESPONSE=$(curl -k --write-out "%{http_code}" --silent --output /dev/null "$CONTROLLER_URL")

    # Check if the response code is not 200 (OK)
    if [[ "$RESPONSE" -ne 200 ]]; then
        echo "Controller is down, shutting down Host_B..."

        # Shut down the system
        # Uncomment the following line to enable shutdown (use with caution)
        # sudo shutdown now

        # For testing, we will exit the loop instead of shutting down
        break
    else
        echo "It is still running."
    fi

    # Wait for 5 seconds before checking again
    sleep 5
done

# Exit with success after breaking out of the loop
exit 0
