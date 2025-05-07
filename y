#!/usr/bin/env bash

# Date: July 23, 2024
# The GitHub: https://github.com/yt-dlp/yt-dlp
# Article: https://www.rapidseedbox.com/blog/yt-dlp-complete-guide
#
# Options:
OPT_1="bv*+ba" # The best video and audio 
OPT_2="bv*[height=1080]+ba" # The best video with "1080" only and best audio   

OPT="-f ${OPT_2}"

# Output FORMAT:
OUTPUT_FORMAT="--merge-output-format mp4"
#OUTPUT_FORMAT="--merge-output-format avi"

# The LINK:
WEB_LINK="$1"

cd /Users/khasanov/Movies/videos 
/opt/local/bin/yt-dlp ${OPT} ${OUTPUT_FORMAT} ${WEB_LINK} || /opt/local/bin/yt-dlp ${OUTPUT_FORMAT} ${WEB_LINK} 
