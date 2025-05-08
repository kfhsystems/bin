#!/bin/bash

# URLs of the Ansible Automation Platform controllers
CONTROLLER_URL_1="https://controller.karshi.ca"
CONTROLLER_URL_2="https://another-controller.example.com" # Replace with the second controller's URL
CONTROLLER_URL_3="https://third-controller.example.com"  # Replace with the third controller's URL
# I added the "-L" option to avoid 301 error 
# Check the status of the controllers every 5 seconds
while true; do
    # Use curl to check if the first service is available
    RESPONSE_1=$(curl -k -L --write-out "%{http_code}" --silent --output /dev/null "$CONTROLLER_URL_1")
    
    # Use curl to check if the second service is available
    RESPONSE_2=$(curl -k -L --write-out "%{http_code}" --silent --output /dev/null "$CONTROLLER_URL_2")
    
    # Use curl to check if the third service is available
    RESPONSE_3=$(curl -k -L --write-out "%{http_code}" --silent --output /dev/null "$CONTROLLER_URL_3")

    # Check if all three response codes are not 200 (OK)
    if [[ "$RESPONSE_1" -ne 200 && "$RESPONSE_2" -ne 200 && "$RESPONSE_3" -ne 200 ]]; then
        echo "All three controllers are down, shutting down Host_B..."
        
        # Shut down the system
        # Uncomment the following line to enable shutdown (use with caution)
        # sudo shutdown now
        
        # For testing, we will exit the loop instead of shutting down
        break
    else
        echo "At least one controller is still running."
    fi

    # Wait for 5 seconds before checking again
    sleep 5
done

# Exit with success after breaking out of the loop
exit 0
