#!/bin/bash

# Format: Day/Month/Year  Hour:Minute:Second
DATE_TIME_FORMAT="+DATE: %d/%m/%Y TIME: %H:%M:%S"
DATE_TIME=$(/bin/date "${DATE_TIME_FORMAT}")

LOG_FILE=/tmp/AAP_Hub_start.log

# Database connection details
HOST="172.16.100.210"      # Replace this with the actual hostname or IP address
USER="awx"   # Replace with your PostgreSQL username
DBNAME="awx"   # Replace with the name of the database you want to check

echo "*  ${DATE_TIME}" > ${LOG_FILE}

while true; do
    # Checking the Database status
    #if psql -h "$HOST" -U "$USER" -d "$DBNAME" -c '\q' 2>/dev/null; then
    DB_STATUS=$(pg_isready -h "$HOST" -U "$USER" -d "$DBNAME" | grep -qw accepting; echo $?)
    echo "Database Status : ${DB_STATUS}"
    if [[ "$DB_STATUS" -eq 0 ]]
    then 
	    echo "=> The databse Up and Running" >> ${LOG_FILE}
	    echo "=> ... Starting the  AAP Hub " >> ${LOG_FILE}
	    
	    echo "=> The databse Up and Running"
	    echo "=> ... Starting the  AAP Hub "
	    # Put the AAP Hub start up command  here...
	    
	    echo "=> ... We have sucessfully started the AAP Hub" >> ${LOG_FILE}
	    break
	    
	    
    else
        echo "The database did not started yet"
        echo "=> ... The database did not started yet!" >> ${LOG_FILE}
	
    fi
    sleep 3 # Wait for 3 seconds before the next check
done
exit 0

