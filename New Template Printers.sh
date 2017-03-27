#!/bin/bash

#	HCCSC 2015 for OS 10.9.x - 10.10.5
#
#	Checks to see if a specific printer driver is installed & displays feedback.
#		If the driver is found an affirmative notification is displayed and the printer is installed.
#		If the driver is not found a negative notification is displayed and the process stops.
# FOR MODIFICATION: Leave ""'s, replace <_>
#
#

#VARIABLES
#Enter information into the four different variable fields 
#You can run into trouble if your fileserver or printer names use underscores

#VAR_PNAME is the printer's name
	VAR_PNAME=RO-OFFICE-BIZHUB4700P


#VAR_PDRIVER is the printer's driver location, quotations are necessary for filenames with spaces

	#magicolor5670
	#VAR_PDRIVER="/Library/Printers/PPDs/Contents/Resources/KONICA MINOLTA mc5670PS.gz"
	
	#bizhub4700p
	VAR_PDRIVER="/Library/Printers/PPDs/Contents/Resources/KONICA MINOLTA bizhub 4700P.gz"
	
	#bizhub654e
	#VAR_PDRIVER="/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA654e.gz"
	
	#bizhub958
	#VAR_PDRIVER="/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA958.gz"
	
	#bizhubc3110
	#VAR_PDRIVER="/Library/Printers/PPDs/Contents/Resources/KONICA MINOLTA C3110.gz"

	#bizhubc368
	#VAR_PDRIVER="/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC368.gz"
	
	#bizhubc454e
	#VAR_PDRIVER="/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC454e.gz"
	
	#bizhubc654e
	#VAR_PDRIVER="/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC654e.gz"
	
	#bizhubc754e
	#VAR_PDRIVER="/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC654e.gz"
	
	#lexmarkc4150
	#VAR_PDRIVER="/Library/Printers/PPDs/Contents/Resources/Lexmark C4100 Series.gz"


#VAR_PSERVER is the print server location
	VAR_PSERVER=V1-PRINT-01

#VAR_DOMAIN is the Domain the print server is on
	VAR_DOMAIN=HCCSC.k12.in.us


#COMMANDS
if [ -f "$VAR_PDRIVER" ];
    then
	osascript -e 'display notification "Driver found, installing printer..." with title "Printer Setup:"'


	#LPADMIN REMOVE PRINTERS COMMANDS
	#Removes any similarly named printer queues
	lpadmin -x $VAR_PSERVER-$VAR_PNAME
	lpadmin -x $VAR_PNAME
	lpadmin -x AN-DC-01-$VAR_PNAME




	#LPADMIN ADD PRINTER COMMAND
	#Adds the printer with grayscale=on, authentication=always, and sharing=off 
	lpadmin -p $VAR_PSERVER-$VAR_PNAME -o auth-info-required=username,password -o printer-is-shared=false -E -v smb://$VAR_PSERVER.$VAR_DOMAIN/$VAR_PNAME -P "$VAR_PDRIVER" -D $VAR_PNAME


    else
    osascript -e 'display notification "DRIVER NOT FOUND. Please install the driver, or contact your Technology Specialist." with title "Printer Setup:"'
    exit -1
fi


exit 0
