#!/bin/bash

#	Name: fix_fwcld_plist_read.sh
#	Author: J Humphrey
#	Date: May 18th, 2017
#
#	Notes:
#	This is a script to fix FW Kiosk display details
#
#	Version Info:
#	1.0 - Initial script	
#	1.1 - Added Ryan Log funtions
#
#	ToDo:
#
#
#



#log all to filewave client log

exec 1>>/var/log/fwcld.log

exec 2>>/var/log/fwcld.log

echo "Running fwcld.plist details fix script

chmod o+r /usr/local/etc/fwcld.plist
