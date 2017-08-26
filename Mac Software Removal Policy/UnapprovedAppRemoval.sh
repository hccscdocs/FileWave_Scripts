#!/bin/bash

#  Name: Unapproved_App_List.sh
#  Author: Matt Krause mkrause@hccsc.k12.in.us
#  Date: March 14, 2017
#
#  Notes:
#  This is a script to remove disallowed apps on MacBooks
#
#  Version Info:
#  1.0.0 - Initial script (MK)
#  1.1.0 - Added for loops (MK 20170316)
#  1.2.0 - Added Script header info, alt loging function, adjusted script format for readability (JRW 20170317)
#  2.0.0 - Works from a whitelist instead of blacklist. Generalized app removal in home folders. (MK 20170323)
#  2.1.0 - Now outputs a single line per removal, rather than verbose rm logging. (MK 20170328)
#  2.1.1 - Added support for TI Calc App and .rom file(JFH 82417)
#  ToDo:
#
#
#

#log all to filewave client log

exec 1>>/var/log/fwcld.log

#FileWave client log file location
LOG_FILE='/var/log/fwcld.log'

# Set DEBUG to 1 to see DEBUG Messages
DEBUG=0

# Debug function
# Usage: db message in parts
function db {
if [ $DEBUG -eq 1 ];
then
echo "$@"
fi
}

# Log function, handles input from stdin or from arguments
# Usage: log message in parts
# Usage2: echo message | log
function log {
# If there are parameters read from parameters
if [ $# -gt 0 ]; then
echo "$(date +"%Y-%m-%d %H:%M:%S")|HCCSC|INFO| $@" >> $LOG_FILE
db "$@"
else
# If there are no parameters read from stdin
while read data
do
echo "$(date +"%Y-%m-%d %H:%M:%S")|HCCSC|INFO| $data" >> $LOG_FILE
db "$data"
done
fi
}

# Temporarily modify the internal field separator to avoid escape character conflict
oIFS=$IFS
IFS=$'\n'

# Build a list of apps to be removed, by granting exceptions for all allowed contents of /Applications.
removeList=$(ls /Applications |
 grep -iv '.DS_Store' |
 grep -iv '.localized' |
 grep -iv Adobe |
 grep -iv 'App\ Store.app' |
 grep -iv 'Arduino.app' |
 grep -iv Audacity |
 grep -iv 'Automator.app' |
 grep -iv 'Calculator.app' |
 grep -iv 'Calendar.app' |
 grep -iv 'Chess.app' |
 grep -iv 'Contacts.app' |
 grep -iv DRC\ INSIGHT\ Online\ Assessments |
 grep -iv 'Destiny\ Discover.app' |
 grep -iv 'DVD\ Player.app' |
 grep -iv 'Dashboard.app' |
 grep -iv 'Dictionary.app' |
 grep -iv 'Dropbox.app' |
 grep -iv eInstruction |
 grep -iv 'FaceTime.app' |
 grep -iv 'FlashPrint.app' |
 grep -iv 'Font\ Book.app' |
 grep -iv 'Fusion360.app' |
 grep -iv 'Game\ Center.app' |
 grep -iv 'GarageBand.app' |
 grep -iv 'GeoGebra.app' |
 grep -iv 'Google\ Chrome.app' |
 grep -iv 'Google\ Drive.app' |
 grep -iv 'Google\ Earth\ Pro.app' |
 grep -iv 'GSP5.app' |
 grep -iv 'iBooks.app' |
 grep -iv 'iBooks\ Author.app' |
 grep -iv 'iCell\ 3.0.app' |
 grep -iv 'Image\ Capture.app' |
 grep -iv 'iMovie.app' |
 grep -iv 'Inspiration\ 9.app' |
 grep -iv 'iTunes.app' |
 grep -iv Java\ Applets |
 grep -iv 'Keynote.app' |
 grep -iv 'Kindle.app' |
 grep -iv KSP |
 grep -iv 'KSP.app' |
 grep -iv 'Launcher.app' |
 grep -iv 'Launchpad.app' |
 grep -iv 'LEGO\ MINDSTORMS\ Education\ EV3.app' |
 grep -iv Logger\ Pro\ 3 |
 grep -iv 'Mail.app' |
 grep -iv 'Maps.app' |
 grep -iv 'Messages.app' |
 grep -iv 'Microsoft\ Excel.app' |
 grep -iv 'Microsoft\ OneNote.app' |
 grep -iv 'Microsoft\ OutLook.app' |
 grep -iv 'Microsoft\ PowerPoint.app' |
 grep -iv Microsoft\ Silverlight |
 grep -iv 'Microsoft\ Word.app' |
 grep -iv 'Mission\ Control.app' |
 grep -iv 'MuseScore\ 2.app' |
 grep -iv 'NWEA\ Lockdown\ Browser.app' |
 grep -iv 'Notability.app' |
 grep -iv 'Notes.app' |
 grep -iv 'Numbers.app' |
 grep -iv 'OverDrive\ Media\ Console.app' |
 grep -iv 'Pages.app' |
 grep -iv 'Photo\ Booth.app' |
 grep -iv 'Photos.app' |
 grep -iv 'Preview.app' |
 grep -iv 'QuestarStudent.app' |
 grep -iv 'QuickTime\ Player.app' |
 grep -iv 'Reminders.app' |
 grep -iv 'Safari.app' |
 grep -iv 'Siri.app' |
 grep -iv SketchUp\ 2016 |
 grep -iv Sqord |
 grep -iv 'Stickies.app' |
 grep -iv 'System\ Preferences.app' |
 grep -iv 'TestNav.app' |
 grep -iv 'TextEdit.app' |
 grep -iv 'Time\ Machine.app' |
 grep -iv 'Tux\ Paint.app' |
 grep -iv Utilities |
 grep -iv 'VLC.app' |
 grep -iv Wacom |
 grep -iv 'wabbitEmu.app' |
 grep -iv 'WeDo\ 2.0.app') |
cd /Applications
echo "**************************************************"
echo "* Removing unapproved content from /Applications *"
echo "**************************************************"
for a in $removeList
do
 echo 'Removing:' $a
 rm -rf $a
done

echo "*************************************************"
echo "* Removing unapproved content from home folders *"
echo "*************************************************"
usersList=$(ls /Users | grep -v ".localized")
for i in $usersList
do
find /Users/$i -name '*.app' | grep -iv '/*/*/Library' | grep -iv '/*/*/Desktop/KSP_osx' |
 while read -r u; do
  echo 'Removing:' $u
  rm -rf $u
 done

 echo "Removing additional files"

 find /Users/$i/ -name "*.dmg" -type f -delete -print
 find /Users/$i/ -name "*.iso" -type f -delete -print
 find /Users/$i/ -name "*.gba" -type f -delete -print
 find /Users/$i/ -name "*.pkg" -type f -delete -print
 find /Users/$i/ -name "*.exe" -type f -delete -print
 find /Users/$i/ -name "*.save" -type f -delete -print
 find /Users/$i/ -name "*minecraft*.jar" -type f -delete -print
 find /Users/$i/ -name "*spotify*.zip" -type f -delete -print

done

# Restore the default IFS - space, tab, and newline
IFS=$oIFS