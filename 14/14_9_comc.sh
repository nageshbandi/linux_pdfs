#!/bin/sh
# comc.sh: Script that is called by different names
#
lastfile=`ls -t *.c | head -n 1`
command=$0                   # Assigning a special parameter to a variable - OK
executable=`expr $lastfile : '\(.*\).c'`     # Removes .c; foo.c becomes foo
case $command in
        *runc) $executable ;;                # Runs the executable
         *vic) vi $lastfile ;;
        *comc) cc -o $executable $lastfile && 
               echo "$lastfile compiled successfully" ;;
esac
