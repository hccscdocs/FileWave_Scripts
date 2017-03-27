#!/bin/bash

#log all to filewave client log

exec 1>>/var/log/fwcld.log

exec 2>>/var/log/fwcld.log

echo "Removing MS Word Preferences as Root [hidden module fix]..."

temp=$(ls /Users | grep -v ".localized" | grep -v "Shared")
for i in $temp
do
rm /Users/${i}/Library/Group\ Containers/UBF8T346G9.Office/User\ Content.localized/Startup.localized/Word/linkcreation.dotm
done
