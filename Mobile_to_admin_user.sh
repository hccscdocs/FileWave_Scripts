#!/bin/bash

# Script to change any current AD mobile accounts to Admin accounts 
# Script coutesy of JAMF Nation and Tom Larkin/Modified by HCCSC JFH 032817

temp=$(ls /Users | grep -v ".localized" | grep -v "Shared")
for i in $temp
do

/usr/sbin/dseditgroup -o edit -a ${i} -t user admin

done

exit 0