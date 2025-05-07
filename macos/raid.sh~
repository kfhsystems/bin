#!/bin/bash

# Wrtitten by Karshi F.Hasanov
# Date: January 9, 2016

# DESCRIPTION: The script converts
# a freshly installed XenServer-6.5 into RAID1 (mirror).
# ISNTALLATION Info: 
# - The XenServer has been installed on the first disk "/dev/sda".
# - During the installation the file 
#   "/opt/xensource/installer/constants.py" had to modify to change
#   the root default size 4096 MB to 65536 MB
# - The total size of the DISK-1 was 1TB and after the installation:
#   	"/dev/sda1" --> where the Server resides (64 GB)
#       "/dev/sda2" --> ????
#   	"/dev/sda3" --> remaining space for the local storage
#   
# RAID1 Setup:
# - We have the DISK-2 (/dev/sdb) which is identical to the DISK-1 in size.
# - The XenServer-6.5 will not load the raid1 module by default, so we must
#   tell the Server by creating the file "/etc/sysconfig/modules/raid.modules"
echo "modprobe raid1" > /etc/sysconfig/modules/raid.modules
# Make sure its executable:
chmod +x /etc/sysconfig/modules/raid.modules

# Delete any old GPT or MBR data:
sgdisk --zap-all /dev/sdb

# Convert an MBR or BSD disklabel disk to a GPT disk
sgdisk --mbrtogpt --clear /dev/sdb

# Replicate partion table from /dev/sda to /dev/sdb with unique identifier
# Be carefull with order: -R <new> <orig>
sgdisk -R /dev/sdb /dev/sda

# Sleep 5 seconds 
sleep 5 

# Change a single partition’s type code.
sgdisk --typecode=1:fd00 /dev/sdb
sgdisk --typecode=2:fd00 /dev/sdb
sgdisk --typecode=3:fd00 /dev/sdb
sleep 5 

# Load riad: Its not loaded by default XenServer-6.5
modprobe md_mod 

# Create md0 (root)
mdadm --create /dev/md0 --level=1 --raid-devices=2 --metadata=0.90 /dev/sdb1 missing 
# Create md1 (swap ???)
mdadm --create /dev/md1 --level=1 --raid-devices=2 --metadata=0.90 /dev/sdb2 missing 
# Create md2 ( Local Storage)
mdadm --create /dev/md2 --level=1 --raid-devices=2 --metadata=0.90 /dev/sdb3 missing 

sleep 5 
#Create root File System
mkfs.ext3 /dev/md0 
# Mount to the root FileSystem
mount /dev/md0 /mnt 
# Replicate root files
cp -xR --preserve=all / /mnt

# Generate RAID confguration
mdadm --detail --scan > /mnt/etc/mdadm.conf 

# Update fstab for new RAID device
sed -i 's/LABEL=[a-zA-Z\-]*/\/dev\/md0/' /mnt/etc/fstab 

mount --bind /dev /mnt/dev
mount -t sysfs none /mnt/sys
mount -t proc none /mnt/proc
chroot /mnt /sbin/extlinux --install /boot
dd if=/mnt/usr/share/syslinux/gptmbr.bin of=/dev/sdb
chroot /mnt
mkinitrd -v -f --theme=/usr/share/splash --without-multipath /boot/initrd-`uname -r`.img `uname -r`
exit
sed -i 's/LABEL=[a-zA-Z\-]*/\/dev\/md0/' /mnt/boot/extlinux.conf # Update extlinux for new RAID device
cd /mnt && extlinux --raid -i boot/
sgdisk /dev/sdb --attributes=1:set:2

#Unmount filesystems and reboot
cd
umount /mnt/dev
umount /mnt/sys
umount /mnt/proc
umount /mnt
sync
shutdown
******************
F8  and choose the second Disk (P2)

# Now replicate other way around
sgdisk -R /dev/sda /dev/sdb 
sgdisk /dev/sda --attributes=1:set:2

sleep 5 # Sleep 5 seconds here if you script this…
mdadm -a /dev/md0 /dev/sda1
mdadm -a /dev/md1 /dev/sda2
mdadm -a /dev/md2 /dev/sda3 

# This next command is the only command you have to manually update before pasting in. 
# Find the UUID of your xenserver host and paste it between the <> below
xe sr-create content-type=user device-config:device=/dev/md2 host-uuid=<UUID of xenserver host> name-label="RAID 1" shared=false type=lvm
# Watch rebuild progress and wait until no arrays are rebuilding before proceeding with any reboot
# watch “mdadm --detail /dev/md* | grep rebuild”

