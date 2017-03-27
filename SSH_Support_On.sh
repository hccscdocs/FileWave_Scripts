#	Name: SSH_Support-On.sh
#	Author: J Humphrey
#	Date: Sept 7th, 2016
#
#	Notes:
#	This is a script to enable SSH of MAc OSX for Support
#
#	Version Info:
#	1.0 - Initial script	
#	1.1 - Added Ryan Log funtions
#
#	ToDo:
#
#
#

#!/bin/bash

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
log "Starting SSH_Support_On.sh"

systemsetup -setremotelogin on

 