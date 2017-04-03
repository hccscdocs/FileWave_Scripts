#!/bin/bash

#log all to filewave client log
#JFH 0331.17 v1
exec 1>>/var/log/fwcld.log

exec 2>>/var/log/fwcld.log

echo "Remove extra profile as Root ..."

profiles -R -p HN-JHumphrey-MB.local.1ca944f7-f3d6-4aed-b15c-d5be27377777.Configuration.1ca944f7-f3d6-4aed-b15c-d5be27377777
