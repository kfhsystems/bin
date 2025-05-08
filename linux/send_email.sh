#!/usr/bin/env bash

# Command to execute
COMMAND="ls -al"

# Email settings
EMAIL="karshi.hasanov@icloud.com"
SUBJECT="Command Notification"

# Execute the command
if eval "$COMMAND"; then
    # Command was successful
    echo "The command '$COMMAND' succeeded." | mail -s "$SUBJECT - Success" "$EMAIL"
else
    # Command failed
    echo "The command '$COMMAND' failed." | mail -s "$SUBJECT - Failure" "$EMAIL"
fi
