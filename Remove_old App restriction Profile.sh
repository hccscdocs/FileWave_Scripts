#!/bin/bash

#log all to filewave client log
#Remove old app restriction policy that affected TestNav from Running 
#JFH 0413.17 v1
exec 1>>/var/log/fwcld.log

exec 2>>/var/log/fwcld.log

echo "Remove old Terminal profile as Root/TestNav Issue ..."

profiles -R -p HN-JHumphrey-MB.local.c49fa779-b999-44c2-a179-a42fd6c7e73f.Configuration.c49fa779-b999-44c2-a179-a42fd6c7e73f
