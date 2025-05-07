#!/usr/bin/env python3

import os
import subprocess

List = os.popen("show_backups").readlines()
N = len(List)
print("We have {} backups available)".format(N))


for i in range(N):
	print(List[i])
R = N - 3	
print("Deleting first {} backups)".format(R))
for j in range(R):
        # The "subprocess.call" takes a shell program and its agrument, then executes it.
        # For example: => subprocess.call(["ls", "-all")
        # The same as: => ls -all
	subprocess.call(["delete_single_backup", List[j]])

os.popen("show_backups").readlines()

