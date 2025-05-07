#!/usr/bin/env bash

# The DEV KfhGPT
SRC_DIR="/Volumes/KFH/KFH_Development/Web-Dev/Frameworks/Projects/Express/KfhGPT_DEV"
# The PROD KfhGPT
DEST_DIR="/Volumes/KFH/KFH_Development/Web-Dev/Frameworks/Projects/Express/KfhGPT"

RSYNC_DIR="/usr/bin"
SED_DIR="/opt/local/bin"
RSYNC_OPTIONS="-avz --no-perms --omit-dir-times --delete"

# Synchronize the folders
if ${RSYNC_DIR}/rsync ${RSYNC_OPTIONS} ${SRC_DIR}/ ${DEST_DIR}
	then
	# Change the Port number in KfhGPT/bin/gpt_server from "4444" to "3333"
	${SED_DIR}/sed -i  's/4444/3333/g' ${DEST_DIR}/bin/gpt_server
	# Remove the Git from the PROD
	/bin/rm -rf ${DEST_DIR}/.git
fi

