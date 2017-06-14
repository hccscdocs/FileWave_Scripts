#!/bin/bash

#	Name: REMOVE_HNPAC_PROFILE.sh
#	Author: J Humphrey
#	Date: June 14th, 2017
#
#	Notes:
#	This is a script to remove old ENA HN PAC File from MacBooks
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

echo "Remove HN PAC Filter Profile"

profiles -R -p ASC-JHumphrey-iMac.local.fa221501-910b-468e-8c4b-5a913776b4d1.Configuration.fa221501-910b-468e-8c4b-5a913776b4d1
