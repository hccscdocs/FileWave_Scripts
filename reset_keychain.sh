#!/bin/bash

#	Name: reset_keycahin.sh
#	Author: J Humphrey
#	Date: May 19th, 2017
#
#	Notes:
#	This is a script delete keychain after a AD PW reset 
#
#	Version Info:
#	1.0 - Initial script	
#	
#
#	ToDo:
#
#
#



#log all to filewave client log

exec 1>>/var/log/fwcld.log

exec 2>>/var/log/fwcld.log

echo "Running keychain removal script"

temp=$(ls /Users | grep -v ".localized" | grep -v "Shared")
for i in $temp
do
rm -Rf /Users/${i}/Library/Keychains/*
done
