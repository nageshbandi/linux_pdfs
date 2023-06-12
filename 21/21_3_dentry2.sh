#!/bin/sh
# Script: dentry2.sh - Uses eval and shell functions
#
trap 'echo "Program interrupted"; exit' HUP INT TERM
. mainfunc.sh       # Invokes functions valid_string() and anymore ()
  
prompt1="Employee id : " ; prompt2="Name : " ; prompt3="Designation : "
prompt4="Department : " ; prompt5="Date birth : " ; prompt6="Basic pay : "
rekord=
  
flname=`valid_string "Enter the output filename: " 8`
while true ; do
    while [ ${x:=1} -le 6 ] ; do                # x first set to 1
        eval echo \$prompt$x '\\c' 1>&2
        read value$x
        rekord="${rekord}`eval echo \\$value$x`|"
        x=`expr $x + 1`
    done
    echo "$rekord"
    anymore "More entries to add" 1>&2 || break
done > $flname

