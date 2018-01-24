#!/bin/bash

# This is a script that checks Safari's Version on Sierra,
# compares it to the required one to include mitigations
# for Spectre/Meltdown and updates it if necessary.

# set -x

# Check Safari Version
SAFARIVERSION=$(defaults read /Applications/Safari.app/Contents/Info.plist CFBundleShortVersionString)

# Check if safari version is the correct one and install the update if not
if [[ $SAFARIVERSION = "11.0.3" ]];
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
softwareupdate -i Safari11.0.3Sierra-11.0.3
echo $'\n'
echo "+++++++++++++++++++++++++++++++++++++++"
echo " Update Complete! "
echo "+++++++++++++++++++++++++++++++++++++++"
echo $'\n'
fi

# Display instructions
echo " ‼️ Please select the below, copy it and paste it in slack ‼️ "
echo $'\n'
echo "                👇🏼  👇🏼  👇🏼  👇🏼  👇🏼  👇🏼  👇🏼  👇🏼                 "
echo $'\n'

# Get Mac Serial Number
SERIALNUMBER=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')
DISPLAYSERIALNUMBER=$(system_profiler SPDisplaysDataType | awk '/Display Serial Number/ {print $4}')

# Print out current user
echo "My User is:" '`'$USER'`'
# Print out Laptop hostname
echo "My Computer Name is:" '`'$(hostname)'`'
# Print out Serial Number for Inventory
echo "My Mac Serial number is:" '`'$SERIALNUMBER'`'
# Print Display Serial Number
echo "My Display Serial number is:" '`'$DISPLAYSERIALNUMBER'`'
