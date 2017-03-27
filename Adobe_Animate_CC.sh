#!/bin/bash

#log all to filewave client log

exec 1>>/var/log/fwcld.log

exec 2>>/var/log/fwcld.log

echo "Removing Adobe Animate Preferences as Root ..."

rm -R '/Users/$1/Library/Application Support/Adobe/Animate CC 2015.2'
