#!/usr/bin/env bash

#  '/path/to/director' with the actual path to the directory where you want to search.
# '-type f' option tells 'find' to only search for files, excluding directories.

# grep -l "my_search command searches for the specified word in the files and lists the filenames that contain the word.
#                 "l" - small "L"
#     "-l" (small "L") in the “grep” command   means : only output the names of files that contain the specified word.
#     "-I" means: Ignore binary files . This will really speed up!
#
# {} placeholder is used to represent the individual files found by find
#  + at the end ensures that `grep` is executed efficiently with multiple files at once.

/usr/bin/find "$1" -type f -exec grep -Il "$2" {} + > found_list.txt
/bin/echo "The following list of files contain the pattern in search:"
/bin/cat found_list.txt
