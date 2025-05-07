#!/usr/bin/env bash
 

# Initialize an empty string
MSG=""

# Loop through all arguments
for arg in "$@"; do
    MSG+="$arg "
done

echo $MSG

if [ -z "${MSG}" ]
then 
   echo "You must give a message to your commit!"
exit 0
fi


git add .
git commit -m ${MSG}
git push
