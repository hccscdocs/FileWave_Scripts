#!/bin/bash

myuptime=$( uptime | sed 's/,/ /g' | sed 's/:/ /g' | sed 's/\./ /g' )

sudo /usr/local/sbin/FileWave.app/Contents/MacOS/fwcld -custom_write -key custom_string_03 -value "$myuptime"