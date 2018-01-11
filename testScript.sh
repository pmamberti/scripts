#!/bin/bash

# Check Safari Version

SAFARIVERSION=$(defaults read /Applications/Safari.app/Contents/Info.plist | awk '/CFBundleVersion/ {print$3}' | sed 's/[";]//g')
echo $SAFARIVERSION

# Check if safari version is the correct one and install the update if not
if [[ $SAFARIVERSION = "12604.4.7.1.1" ]];
then
echo "Your Version of Safari is up to date!"
else
echo "You must update your version of Safari."
echo "I'll take care of that for you!"
softwareupdate -i Safari11.0.2Sierra-11.0.2
fi
