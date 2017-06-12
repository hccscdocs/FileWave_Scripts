#!/bin/bash

#	Name: ENROLL_MDM_0617_STAFF.sh
#	Author: J Humphrey
#	Date: June 12th, 2017
#
#	Notes:
#	This is a script to do a MDM enroll on a Mac OSX client - from FW Support TID
#	STAFF LADMIN VER
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

echo "Running MDM_ENROLL_0617_STAFF Script"

profiles -I -F /usr/local/etc/MDM\ Enrollment\ Profile.mobileconfig -Y LAdmin