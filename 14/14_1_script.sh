#!/bin/sh
# script.sh: Sample shell script                  
echo "Today's date: `date`"
echo "This month's calendar:"
cal `date "+%m 20%y"`                # This month's calendar
echo "My shell: $SHELL"
