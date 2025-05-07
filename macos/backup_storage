#!/bin/sh

# Date: Feb.12, 2022
 
# The program uses the "tmutil" utility
# For more info, read "tmutil help"

# Modified: 
# * Feb. 15, 2025 : Replaced the "TimeMachine" HD (4T -> 8T) and renamed to "Main_Storage"
# * July 4, 2022


# Format: Day/Month/Year  Hour:Minute:Second
DATE_TIME_FORMAT="+DATE: %d/%m/%Y TIME: %H:%M:%S"
DATE_TIME=$(/bin/date "${DATE_TIME_FORMAT}")

# The disk name SLICE where the TimeMachine is mounted.
SLICE=unset
SLICE=$(diskutil list | grep Main_Storage | awk '{print $NF}')

# The Source folder where we have our files:
SOURCE="/Volumes/KFH"
# Destinantion: /Volumes/TimeMachine/KFH_Backup
DEST="/Volumes/Main_Storage/KFH_Backup"

LOG_DIR=${SOURCE}/Logs
#LOG_DIR=${BACKUP_DISK}/Logs
LOG_FILE=${LOG_DIR}/KFH_Backup_To_Main_Storage.log

RSYNC_DIR="/usr/bin"

# We want to keep the old data:
# RSYNC_OPTIONS="-avz --no-perms --omit-dir-times --delete"
IGNORE_FOLDERS=".Trashes"
RSYNC_OPTIONS="-avz --no-perms --omit-dir-times --exclude=${IGNORE_FOLDERS}"


RSYNC=${RSYNC_DIR}/rsync

function check_mount() {
# Get the disk partition (slice) number:

		# Show the mount point:
		echo "The Disk Slice: ${SLICE}"

		# Mount the slice usting the "diskutil" command:
		sudo diskutil mount /dev/$SLICE

		# Check the return value of the last command. If it is not zero (success):
        if [ $? -ne 0 ]; then 
        	echo "  The mounting has failed !!!"
            exit 1 # Exit the program!
        fi
}

function unmount(){

		# Mount the slice usting the "diskutil" command:
		sudo diskutil eject $SLICE

		# Check the return value of the last command. If it is not zero (success):
        if [ $? -ne 0 ]; then 
        	echo "...The disk ejection has beein failed !!!"
            exit 1 # Exit the program!
        fi
}

function backup() {
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE}/ ${DEST}
        then
            echo "*   ${SOURCE}: Success..." >> ${LOG_FILE}
            echo "<=== ...the backup for ${SOURCE} is done!"

    else
        echo "ERROR: The ${SOURCE} backup is failed!" >> ${LOG_FILE}
         echo "*   ${DATE_TIME}" >> ${LOG_FILE}
		exit 1
    fi
	}

function set_datetime() {

        # Set the Date and Time:
        echo "*   ${DATE_TIME}" >> ${LOG_FILE}
    }

# Main
check_mount
backup
set_datetime

