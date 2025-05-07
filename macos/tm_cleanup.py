#!/usr/bin/env python3

# Author: Karshi F. Hasanov
# Date: Sept.28, 2021
# Last Modified: March 3, 2023

import subprocess

# => tmutil listbackups
msg = subprocess.run(['tmutil', 'listbackups'], stdout=subprocess.PIPE,
                     stderr=subprocess.PIPE, capture_output=False,
                     text=True
                     )

# Check if the Backup disk is avilable and mounted:
# If the "subprocess.run" command is successful, it should retrun "0" 
if msg.returncode !=0 :
        print("The Backup Disk is NOT mounted!")
        exit() 

list_of_files = msg.stdout.split('\n')

# Remember: Remove the extra empty item at the end of the list:
list_of_files.pop()
print("The total number of the backup files:")

for line in list_of_files:
    print(line)

# Remove last 2 items, so we don't delete them:
remove_files = list_of_files[:-2]
if remove_files:
    print("The files we want to be removed: ")
    for line in remove_files:
        print(line)
        # Delete the files:
        print("Deleting process started ...")
        for i in range(len(remove_files)):
            subprocess.run(['sudo', 'tmutil', 'delete', remove_files[i]],
                           stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                           capture_output=False, text=True
                           )
        print("Done")
else:
    print(f'...Nothing to remove. Number of backuped files are : {len(list_of_files)}')

