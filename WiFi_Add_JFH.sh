#!/bin/bash

#WiFi Add Script 030317 JFH

exec 1>>/var/log/fwcld.log

exec 2>>/var/log/fwcld.log


networksetup -addpreferredwirelessnetworkatindex $wifi "ASC-Jhumphrey-iMac" 0 WPA2 hccsc2013!

