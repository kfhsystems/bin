#!/bin/sh
# Written by KFH: karshi.hasanov@utoronto.ca
# DateL Oct.24, 2019
# Description: The purpose of this scripts is to backup from th external USB
# Seagate 2T backup to the WD My Book Pro extrental drive
# The following folders are currently backed:
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


# Modified Date: Oct.25, 2019
# - Finding and removing the "_Store" are disabled.

# Format: Day/Month/Year  Hour:Minute:Second
DATE_TIME=$(/bin/date "+DATE: %d/%m/%Y TIME: %H:%M:%S")

SOURCE_DISK="/Volumes/KFH"
BACKUP_DISK="/Volumes/KFH_Backup"
LOG_DIR=${BACKUP_DISK}/Logs
LOG_FILE=${LOG_DIR}/KFH_Backups.log
RSYNC_DIR="/usr/bin"

# First we want to check if the External Backup Disk is available or mounted

if /sbin/mount | grep -q ${SOURCE_DISK} &&  /sbin/mount | grep -q ${BACKUP_DISK} ; then

        # Set the Date and Time:
        echo "Date: ${DATE_TIME}" >> ${LOG_FILE}
        echo ""

	# ***************Backing up the KFH_Main to My_Book_Pro  *********************/
        SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Main
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Main
	
        # echo "Removing '".*_Store"' from the ${SOURCE_DISK_DIR}"
	# find ${SOURCE_DISK_DIR} -name ".*_Store" -exec rm '{}' \;

        echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

			# echo "Removing '".*_Store"' files from ${BACKUP_DISK_DIR}"
			# find ${BACKUP_DISK_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi # The end of rsync "if"

        # ***************Backing up the KFH_Library to My_Book_Pro  *********************/
        SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Library
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Library
        # echo "Removing '".*_Store"' from the ${SOURCE_DISK_DIR}"
	# find ${SOURCE_DISK_DIR} -name ".*_Store" -exec rm '{}' \;

        echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

			# echo "Removing '".*_Store"' files from ${BACKUP_DISK_DIR}"
			# find ${BACKUP_DISK_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi # The end of rsync "if"        


        # ***************Backing up the KFH_Projects to My_Book_Pro  *********************/
        SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Projects
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Projects

        # echo "Removing '".*_Store"' from the ${SOURCE_DISK_DIR}"
	# find ${SOURCE_DISK_DIR} -name ".*_Store" -exec rm '{}' \;

        echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times --exclude 'WebApps' ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

			# echo "Removing '".*_Store"' files from ${BACKUP_DISK_DIR}"
			# find ${BACKUP_DISK_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi # The end of rsync "if"


        # ***************Backing up the KFH_Software to My_Book_Pro  *********************/
        SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Software
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Software

        # echo "Removing '".*_Store"' from the ${SOURCE_DISK_DIR}"
	# find ${SOURCE_DISK_DIR} -name ".*_Store" -exec rm '{}' \;

        echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

			# echo "Removing '".*_Store"' files from ${BACKUP_DISK_DIR}"
			# find ${BACKUP_DISK_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi # The end of rsync "if"


        # ***************Backing up the KFH_Audio-Video to My_Book_Pro  *********************/
        SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Audio-Video
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Audio-Video

        # echo "Removing '".*_Store"' from the ${SOURCE_DISK_DIR}"
	# find ${SOURCE_DISK_DIR} -name ".*_Store" -exec rm '{}' \;

        echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

			# echo "Removing '".*_Store"' files from ${BACKUP_DISK_DIR}"
			# find ${BACKUP_DISK_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi # The end of rsync "if"


        # ***************Backing up the KFH_Training to My_Book_Pro  *********************/
        SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Training
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Training

        # echo "Removing '".*_Store"' from the ${SOURCE_DISK_DIR}"
	# find ${SOURCE_DISK_DIR} -name ".*_Store" -exec rm '{}' \;

        echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

			# echo "Removing '".*_Store"' files from ${BACKUP_DISK_DIR}"
			# find ${BACKUP_DISK_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi # The end of rsync "if"
        
      # ***************Backing up the KFH_Training_Hobies to My_Book_Pro  *********************/
        SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Training_Hobies
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Training_Hobies

        # echo "Removing '".*_Store"' from the ${SOURCE_DISK_DIR}"
	# find ${SOURCE_DISK_DIR} -name ".*_Store" -exec rm '{}' \;

        echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

			# echo "Removing '".*_Store"' files from ${BACKUP_DISK_DIR}"
			# find ${BACKUP_DISK_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi # The end of rsync "if"
      
      # ***************Backing up the KFH_Development to My_Book_Pro  *********************/
        SOURCE_DISK_DIR=${SOURCE_DISK}/KFH_Development
	BACKUP_DISK_DIR=${BACKUP_DISK}/KFH_Development

        # echo "Removing '".*_Store"' from the ${SOURCE_DISK_DIR}"
	# find ${SOURCE_DISK_DIR} -name ".*_Store" -exec rm '{}' \;

        echo "===> ...backing up the ${SOURCE_DISK_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SOURCE_DISK_DIR}/ ${BACKUP_DISK_DIR}
		then
			echo "${SOURCE_DISK_DIR}: Success..." >> ${LOG_FILE}
			echo "<=== ...the backup for ${SOURCE_DISK_DIR} is done!"

			# echo "Removing '".*_Store"' files from ${BACKUP_DISK_DIR}"
			# find ${BACKUP_DISK_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SOURCE_DISK_DIR} backup is failed!" >> ${LOG_FILE}
		exit 1
	fi # The end of rsync "if"


        # ******************************** THE END of the ALL Backups *******************************
        echo "************************************************" >> ${LOG_FILE}
else
	echo " The ${BACKUP_DISK} is NOT mounted !"
        echo " Please mount the external BACKUP DISK first !!!"
        exit 1
fi # The end of root "if"

