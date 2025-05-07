#!/bin/sh
# Written by KFH: karshi.hasanov@icloud.com
# Date Oct.24, 2019
# Description: The purpose of this scripts is to backup from 
#              the source  to the tardet destination using 
#              the "rsync".
#              Note: This back up used in the WD My Book Pro.
#                    - The device has two hard drivers.
#                    - No RAID used ( each Hard Drive acts independently)
#                    - When you run WD Divr Utilities, it should say: 
#                      RAID Status => The Current Configuration: Individual Drivers (JBOD)
#                    - The first HD ( Left HD) is the "KFH" and on the second (Right) is "KFH_Backup"
#                    
#
# The following folders are included in the list of backups:
# * KFH_Main
# * KFH_Library
# * KFH_Projects
# * KFH_Software
# * KFH_Audio-Video
# * KFH_Training
# * KFH_Training_Hobies
# * KFH_Development
# * KFH_Data
# * KFH_ISO_Images

# The "rsync" command options

# `-a`: This stands for "archive mode." It is a combination of several options that preserve various attributes 
#       (such as timestamps, symlinks, etc.) of files and directories, effectively making a complete copy.

# `-v`: This stands for "verbose." It provides detailed output during the execution of the command, showing what files are being transferred.

# `-z`: This enables compression during the transfer, reducing the amount of data that needs to be sent over the network, 
#       which can speed up the transfer process, especially for larger files.

# `--no-perms`: This option tells `rsync` not to preserve the permission bits of files and directories. 
#               This means that the transferred files will inherit the permissions of the destination rather than keeping 
#               the original source permissions.

# `--omit-dir-times`: This option tells `rsync` to skip updating the timestamps of directories when syncing. By default, `rsync` updates the modification times of directories, but this option prevents that from happening.

# `--delete`: This option tells `rsync` to delete files in the destination directory that are not present in the source directory. This is useful for ensuring that the destination is an exact mirror of the source.



#  The Last Modified Date:
# * January 20, 2024: - Just update the Description.
# * February 12, 2022:	- The block of the codes were written as functions.
# * June 28, 2022: - Added the "--delete" option to make the source and destination to be in sync.


# Format: Day/Month/Year  Hour:Minute:Second
DATE_TIME_FORMAT="+DATE: %d/%m/%Y TIME: %H:%M:%S"
DATE_TIME=$(/bin/date "${DATE_TIME_FORMAT}")
#DATE_TIME=$(/bin/date "+DATE: %d/%m/%Y TIME: %H:%M:%S")

SOURCE_DISK="/Volumes/KFH"
BACKUP_DISK="/Volumes/KFH_Backup"

LOG_DIR=${SOURCE_DISK}/Logs
#LOG_DIR=${BACKUP_DISK}/Logs
LOG_FILE=${LOG_DIR}/KFH_Backups.log

RSYNC_DIR="/usr/bin"
RSYNC_OPTIONS="-avz --no-perms --omit-dir-times --delete"
RSYNC=${RSYNC_DIR}/rsync  

function check_mount() {
	# Check if the External Backup Disk is available or mounted

	if /sbin/mount | grep -q ${BACKUP_DISK}
		then
			echo "Starting..."
	else
		echo " The ${BACKUP_DISK} is NOT mounted !"
		echo " Mounting the ${BACKUP_DISK}"

		# Get the disk partition (slice) number:
		SLICE=$(diskutil list | grep KFH_Backup | awk '{ print $NF }')

		# Mount the slice usting the "diskutil" command:
		sudo diskutil mount /dev/$SLICE

		# Check the return value of the last command. If it is not zero (success):
        if [ $? -ne 0 ]; then 
        	echo "  The mounting has failed !!!"
            exit 1 # Exit the program!
        fi
    fi
    }
function set_datetime() {

        # Set the Date and Time:
        echo "*   ${DATE_TIME}" >> ${LOG_FILE}
	}

function KFH_Main(){
	# *************** Backing up the KFH_Main *********************/
    SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Main
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Main
	
    # echo "Removing '".*_Store"' from the ${SOURCE_DISK_DIR}"
	# find ${SOURCE_DISK_DIR} -name ".*_Store" -exec rm '{}' \;

    echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	
	# Rsync: 
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "*   ${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"
	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi 
	} # The end of the "KFH_Main()"


function KFH_Library() {
    # *************** Backing up the KFH_Library *********************/
    SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Library
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Library
     
    echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	#if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times --delete ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "*   ${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi      
	}  # The end of the "KFH_Library()"

function KFH_Projects() {
    # *************** Backing up the KFH_Projects *********************/
    SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Projects
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Projects


    echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	#if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times --delete ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "*   ${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"
		
	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi 

    } # The end of the "KFH_Projects()"

function KFH_Software() {
    # *************** Backing up the KFH_Software *********************/
    SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Software
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Software


    echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	#if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times --delete ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "*   ${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi 

}  # The end of the "KFH_Software()

function KFH_Audio_Video() {
    # *************** Backing up the KFH_Audio-Video *********************/
    SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Audio_Video
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Audio_Video


    echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	#if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times --delete ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "*   ${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi 

} # The end of the "KFH_Audio_Video()"

function KFH_Training() {
    # *************** Backing up the KFH_Training *********************/
    SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Training
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Training


    echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	#if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times --delete ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "*   ${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi 
} # The end of the "KFH_Training()"


function KFH_Training_Hobies() {        
    # *************** Backing up the KFH_Training_Hobies *********************/
    SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Training_Hobies
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Training_Hobies

    echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	#if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times --delete ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "*   ${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi 
} # The end of the "KFH_Training_Hobies()""


function KFH_Development() {      
    # ***************Backing up the KFH_Development   *********************/
    SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Development
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Development

    echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	#if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times --delete ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "*   ${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi 

} # The end of the "KFH_Development()"


function KFH_Data() {      
    # ***************Backing up the KFH_Development   *********************/
    SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Data
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Data

    echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	#if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times --delete ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "*   ${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi 

} # The end of the "KFH_Data()"

function KFH_ISO_Images() {      
    # ***************Backing up the KFH_Development   *********************/
    SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_ISO_Images
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_ISO_Images

    echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	#if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times --delete ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
	if ${RSYNC} ${RSYNC_OPTIONS}  ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "*   ${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi 

} # The end of the "KFH_ISO_Images()"


function unmount(){
	    #Get the disk partition (slice) number:
		SLICE=$(diskutil list | grep KFH_Backup | awk '{ print $NF }')

		# Mount the slice usting the "diskutil" command:
		sudo diskutil eject /dev/$SLICE

		# Check the return value of the last command. If it is not zero (success):
        if [ $? -ne 0 ]; then 
        	echo "...The disk ejection has beein failed !!!"
            exit 1 # Exit the program!
        fi
}
# Run the functions:
check_mount

KFH_Main
KFH_Library
KFH_Projects
KFH_Software
KFH_Audio_Video
KFH_Training
KFH_Training_Hobies
KFH_Development
KFH_Data
KFH_ISO_Images
#unmount
set_datetime

# ******************************** THE END of the ALL Backups *******************************
echo "******************************************" >> ${LOG_FILE}
tail -n 13 /Volumes/KFH/Logs/KFH_Backups.log

	


