#!/bin/bash

# generate local user account based on UID of greater than 1000, if multiple AD accounts exist this will grab all of them
# Script coutesy of JAMF Nation and Tom Larkin

userList=$(/usr/bin/dscl . list /Users UniqueID | /usr/bin/awk '$2 > 1000 \{ print $1 }')

for u in ${userList} ; do

/usr/sbin/dseditgroup -o edit -a ${u} -t user admin

done

exit 0