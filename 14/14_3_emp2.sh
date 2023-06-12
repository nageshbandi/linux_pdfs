#!/bin/sh
# emp2.sh: Non-interactive version  - uses command line arguments 
#
echo "Program: $0                # $0 contains the program name
The number of arguments specified is $#
The arguments are $*"            # All arguments stored in $*
grep "$1" $2
echo "\nJob Over"
