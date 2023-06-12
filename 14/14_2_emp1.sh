#!/bin/sh
# emp1.sh: Interactive version - uses read to take two inputs
#
echo "Enter the pattern to be searched: \c"     # No newline
read pname
echo "Enter the file to be used: \c"            # Use echo -e or 
read flname                                     # shopt -s xpg_echo in Bash
echo "Searching for $pname from file $flname"
grep "$pname" $flname
echo "Selected records shown above"
