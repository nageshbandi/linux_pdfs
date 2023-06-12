#!/usr/bin/ksh
# Script: dateval.sh - Validates a date field using an array
IFS="/"
n="[0-9][0-9]"
set -A month_arr 0 31 29 31 30 31 30 31 31 30 31 30 31

while echo "Enter a date: \c" ; do
  read value
  case "$value" in
        "") echo "No date entered" ; continue ;;
  $n/$n/$n) set $value
            let rem="$3 % 4"
            if [ $2 -gt 12 -o $2 -eq 0 ] ; then
                echo "Illegal month" ; continue
            else
                case "$value" in
          29/02/??) [ $rem -gt 0 ] &&
                    { echo "20$3 is not a leap year" ; continue ; } ;;
                 *) [ $1 -gt ${month_arr[$2]} -o $1 -eq 0 ] &&
                    { echo "Illegal day" ; continue ; } ;;
                esac
            fi;;
         *) echo "Invalid date" ; continue ;;
  esac
  echo "$1/$2/$3" is a valid date
done

