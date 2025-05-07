#!/bin/sh
# Written by KFH: karshi.hasanov@utoronto.ca
# Date: September 15, 2012
# Last Modified Date: December 7, 2017

# Description: The file backs up data from local PC to an external Disk.
# The fllowing folders are getting backed:
#	khasanov/bin
#	khasanov/MAC_Software
#	khasanov/Documents
#       khasanov/Sites
#       
# Updates:
# - The Log file location moved to "/Volumes/Data/Logs"
# - Crontab: Only local Projects will be backed for now.
# Last Update: April 15, 2018
# - Added the "~/Sites" folder
# Format: Day/Month/Year  Hour:Minute:Second
DATE_TIME=$(/bin/date "+DATE: %d/%m/%Y TIME: %H:%M:%S")

BACKUP_DISK="/Volumes/Data"
LOG_DIR=${BACKUP_DISK}/Logs
LOG_FILE=${LOG_DIR}/KFH_Backups.log
RSYNC_DIR="/usr/bin"

# First we want to check if the External Backup Disk is available or mounted

if /sbin/mount | /usr/bin/grep -q ${BACKUP_DISK} ; then



	# ***************Backing up /Users/khasanov/bin  folder *********************/

	SRC_DIR=${HOME}/bin
	DEST_DIR=${BACKUP_DISK}/KFH/KFH_Data/OS/MAC_OS_X/khasanov/bin
	echo "Removing '".*_Store"' from the ${SRC_DIR}"
	find ${SRC_DIR} -name ".*_Store" -exec rm '{}' \;

	echo "===> ...backing up the ${SRC_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SRC_DIR}/ ${DEST_DIR}
		then
			echo " ${SRC_DIR}:  SUCCESS	${DATE_TIME}" >> ${LOG_FILE}
			echo "<=== ...the backup for ${SRC_DIR} is done!"	
						
			echo "Removing '".*_Store"' files from ${DEST_DIR}"
			find ${DEST_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SRC_DIR} backup is failed!"
		exit 1
	fi # The end of rsync "if"     

	# ***************Backing up "Evernote"  Application *********************/
        AS="Application Support"
	SRC_DIR=${HOME}/Library/${AS}/com.evernote.Evernote
	DEST_DIR=${BACKUP_DISK}/KFH/KFH_Data/OS/MAC_OS_X/khasanov/Library/${AS}/com.evernote.Evernote
	echo "Removing '".*_Store"' from the ${SRC_DIR}"
	find "${SRC_DIR}" -name ".*_Store" -exec rm '{}' \;

	echo "===> ...backing up the ${SRC_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times "${SRC_DIR}"/ "${DEST_DIR}"
		then
			echo " ${SRC_DIR}:  SUCCESS	${DATE_TIME}" >> ${LOG_FILE}
			echo "<=== ...the backup for ${SRC_DIR} is done!"	
						
			echo "Removing '".*_Store"' files from ${DEST_DIR}"
			#find ${DEST_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SRC_DIR} backup is failed!"
		exit 1
	fi # The end of rsync "if"     

	# ***************Backing up "Firefox"  Application *********************/
        AS="Application Support"
	SRC_DIR=${HOME}/Library/${AS}/Firefox
	DEST_DIR=${BACKUP_DISK}/KFH/KFH_Data/OS/MAC_OS_X/khasanov/Library/${AS}/Firefox
	echo "Removing '".*_Store"' from the ${SRC_DIR}"
	find "${SRC_DIR}" -name ".*_Store" -exec rm '{}' \;

	echo "===> ...backing up the ${SRC_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times "${SRC_DIR}"/ "${DEST_DIR}"
		then
			echo " ${SRC_DIR}:  SUCCESS	${DATE_TIME}" >> ${LOG_FILE}
			echo "<=== ...the backup for ${SRC_DIR} is done!"	
						
			echo "Removing '".*_Store"' files from ${DEST_DIR}"
			#find ${DEST_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SRC_DIR} backup is failed!"
		exit 1
	fi # The end of rsync "if"     

	# ***************Backing up /Users/khasanov/KFH_Software  folder *********************/

	SRC_DIR=${HOME}/MAC_Software
	DEST_DIR=${BACKUP_DISK}/KFH/KFH_Software/MAC_Software
	echo "Removing '".*_Store"' from the ${SRC_DIR}"
	find ${SRC_DIR} -name ".*_Store" -exec rm '{}' \;

	echo "===> ...backing up the ${SRC_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SRC_DIR}/ ${DEST_DIR}
		then
			echo " ${SRC_DIR}:  SUCCESS	${DATE_TIME}" >> ${LOG_FILE}
			echo "<=== ...the backup for ${SRC_DIR} is done!"	
						
			echo "Removing '".*_Store"' files from ${DEST_DIR}"
			find ${DEST_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SRC_DIR} backup is failed!"
		exit 1
	fi # The end of rsync "if"     

	# ***************Backing up /Users/khasanov/Documents  folder *********************/

	SRC_DIR=${HOME}/Documents
	DEST_DIR=${BACKUP_DISK}/KFH/KFH_Data/Documents
	echo "Removing '".*_Store"' from the ${SRC_DIR}"
	find ${SRC_DIR} -name ".*_Store" -exec rm '{}' \;

	echo "===> ...backing up the ${SRC_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SRC_DIR}/ ${DEST_DIR}
		then
			echo " ${SRC_DIR}:  SUCCESS	${DATE_TIME}" >> ${LOG_FILE}
			echo "<=== ...the backup for ${SRC_DIR} is done!"	
						
			echo "Removing '".*_Store"' files from ${DEST_DIR}"
			find ${DEST_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SRC_DIR} backup is failed!"
		exit 1
	fi # The end of rsync "if"     

	# ***************Backing up /Users/khasanov/Sites  folder *********************/

	SRC_DIR=${HOME}/Sites
	DEST_DIR=${BACKUP_DISK}/KFH/KFH_Data/Sites
	echo "Removing '".*_Store"' from the ${SRC_DIR}"
	find ${SRC_DIR} -name ".*_Store" -exec rm '{}' \;

	echo "===> ...backing up the ${SRC_DIR} folder"
	if ${RSYNC_DIR}/rsync -avz --no-perms --omit-dir-times ${SRC_DIR}/ ${DEST_DIR}
		then
			echo " ${SRC_DIR}:  SUCCESS	${DATE_TIME}" >> ${LOG_FILE}
			echo "<=== ...the backup for ${SRC_DIR} is done!"	
						
			echo "Removing '".*_Store"' files from ${DEST_DIR}"
			find ${DEST_DIR} -name ".*_Store" -exec rm '{}' \;
	else
		echo "ERROR: The ${SRC_DIR} backup is failed!"
		exit 1
	fi # The end of rsync "if"     

##################################### End of All Backups #################################

else # This belong to the Main "if"
	echo " The ${BACKUP_DISK} is NOT mounted !">> ${LOG_FILE}
        echo " Please the external BACKUP DISK first !!!"
        exit 1	
fi # The end of root "if"

