#!/bin/bash

#	Name: REMOVE BAD MDM PROFILE.sh
#	Author: J Humphrey
#	Date: Sept 21st, 2017
#
#	Notes:
#	This is a script to Remove bad MDM Profile pushed out 
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

echo "Removing Bad MDM Profile"

Profiles -R -p com.filewave.ac.enrollment_profile