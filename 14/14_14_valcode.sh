#!/bin/sh
# valcode.sh: Uses a here document to look up a code list
#
IFS="|"        # Reset field separator to pipe
while echo "Enter department code  : \c" ; do
    read dcode
    set -- `grep "^$dcode" << limit
01|accounts|6213
02|admin|5423
03|marketing|6521
04|personnel|2365
05|production|9876
06|sales|1006
limit`                # Closing ` marks end of standard input
  
    case $# in
        3) echo "Department name        : $2\nEmp-id of head of dept : $3\n"
           shift 3 ;;         # Flush out the positional parameters
        *) echo "Invalid code"  ; continue
    esac
done
