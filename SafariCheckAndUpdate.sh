#!/bin/bash

# This is a script that checks Safari's Version on Sierra,
# compares it to the required one to include mitigations
# for Spectre/Meltdown and updates it if necessary.

# Check Safari Version
SAFARIVERSION=$(defaults read /Applications/Safari.app/Contents/Info.plist | awk '/CFBundleVersion/ {print$3}' | sed 's/[";]//g')

# Check if safari version is the correct one and install the update if not
if [[ $SAFARIVERSION = "12604.4.7.1.6" ]];
then
echo $'\n'
echo "+++++++++++++++++++++++++++++++++++++++"
echo "Your Version of Safari is up to date!"
echo "+++++++++++++++++++++++++++++++++++++++"
echo $'\n'
else
echo $'\n'
echo "+++++++++++++++++++++++++++++++++++++++"
echo "You must update your version of Safari."
echo "I'll take care of that for you!"
echo "Safari will close and update now"
echo "+++++++++++++++++++++++++++++++++++++++"
echo $'\n'

# Close Safari and download the update
osascript -e 'quit app "Safari"'
softwareupdate -i Safari11.0.2Sierra-11.0.2
echo $'\n'
echo "+++++++++++++++++++++++++++++++++++++++"
echo " Update Complete! "
echo "+++++++++++++++++++++++++++++++++++++++"
echo $'\n'
fi

# Get Mac Serial Number
SERIALNUMBER=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

# Print out Serial Number for Inventory
echo "Your Serial number is:" '`'$SERIALNUMBER'`'
