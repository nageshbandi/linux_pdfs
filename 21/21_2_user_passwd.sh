#!/bin/sh
# Script: user_passwd.sh - Uses a shell function
#
. mainfunc.sh                   # Script containing valid_string function
QQ
user=`valid_string "Enter your user-id :" 16`
stty -echo                              # Password not to be echoed
password=`valid_string "Enter your password:" 5`
stty echo                              # Turns on echoing facility
echo "\nYour user-id is $user and your password is $password"

