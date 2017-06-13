#!/bin/bash

#	Name: Set_Date_Time.sh
#	Author: J Humphrey
#	Date: June 13th, 2017
#
#	Notes:
#	This is a script to force a time/date sync to address a battery dead before loading issue
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

echo "Running Force Time Sync Script"

ntpdate -u time.apple.com