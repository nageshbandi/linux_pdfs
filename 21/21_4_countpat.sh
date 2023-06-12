#!/bin/sh
# Script: countpat.sh -- Uses exec to handle multiple files
#
exec > $2                       # Open file 1 for storing selected lines
exec 3> $3                      # Open file 4 for storing patterns not found
exec 4> $4                      # Open file 5 for storing invalid patterns
   
[ $# -ne 4 ] && { echo "4 arguments required" ; exit 2 ; }
   
exec < $1                               # Redirecting input
while read pattern ; do
     case "$pattern" in
        ????) grep $pattern emp.lst || 
              echo $pattern not found in file 1>&3 ;;
           *) echo $pattern not a four-character string 1>&4 ;;
     esac
done
exec >/dev/tty               # Redirects standard output back to terminal
echo Job Over
