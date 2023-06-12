#!/bin/sh
# emp3.sh: Using if and else
#
if grep "^$1" /etc/passwd 2>/dev/null   # Search username at beginning of line
   then
       echo "Pattern found - Job Over"
   else
       echo "Pattern not found"
fi
