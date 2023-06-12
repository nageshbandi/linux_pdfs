#!/bin/sh
# emp4.sh: Checks user input for null values - Finally runs emp3a.sh 
#                                              developed previously
if [ $# -eq 0 ] ; then
   echo "Enter the string to be searched: \c"
   read pname
   if [ -z "$pname" ] ; then           # -z checks for a null string
      echo "You have not entered the string" ; exit 1
   fi
   echo "Enter the filename to be used: \c"
   read flname
   if [ ! -n "$flname" ] ; then        # ! -n is the same as -z
      echo "You have not entered the filename" ; exit 2
   fi
   emp3a.sh "$pname" "$flname"         # Runs the script that will do the job
else
   emp3a.sh $*                         # We'll change $* to "$@" soon
fi
