#!/bin/sh

# Date: Feb.12, 2022
 
# The program uses the "tmutil" utility
# For more info, read "tmutil help"

function check_mount() {
# Get the disk partition (slice) number:
        # Search for "Backup" , but discard the "KFH_Back"
		SLICE=$(diskutil list | grep Backup | grep -v KFH_Backup | awk '{ print $NF }')

		# Mount the slice usting the "diskutil" command:
		sudo diskutil mount /dev/$SLICE

		# Check the return value of the last command. If it is not zero (success):
        if [ $? -ne 0 ]; then 
        	echo "  The mounting has failed !!!"
            exit 1 # Exit the program!
        fi
}

function unmount(){
	# This function needs to call immidately after "tmutil startbackup" command!
    # Get the PID of the last command:
	TM_PID=`echo $1`

	# Let the backup to finish its jod:
	while $(kill -0 $TM_PID)
		do
			wait
		done
			
	echo "The backup is done..."
	#Get the disk partition (slice) number:
	SLICE=$(df -Ph | grep /Volumes/Backups | awk ' { print $1 }')

	# Mount the slice usting the "diskutil" command:
	sudo diskutil eject $SLICE

	# Check the return value of the last command. If it is not zero (success):
    if [ $? -ne 0 ]; then 
        echo "...The disk ejection has beein failed !!!"
        exit 1 # Exit the program!
    fi
}

check_mount
tmutil startbackup 
unmount