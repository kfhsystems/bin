#!/bin/sh
# This should show the version of the SBK on my tablet.
cd ~/tmp
wget -O sbkcheck.tar "http://forum.xda-developers.com/attachment.php?attachmentid=740980&d=1317840790" 
tar -xf sbkcheck.tar 
rm sbkcheck.tar 
sudo ./sbkcheck

