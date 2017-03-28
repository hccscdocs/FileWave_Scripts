#!/bin/bash

# generate local user account based on UID of greater than 1000, if multiple AD accounts exist this will grab all of them
# Script coutesy of JAMF Nation and Tom Larkin

temp=$(ls /Users | grep -v ".localized" | grep -v "Shared")
for i in $temp
do

/usr/sbin/dseditgroup -o edit -a ${i} -t user admin

done

exit 0