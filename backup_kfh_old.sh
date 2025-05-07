d!" >> ${LOG_FILE}
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



