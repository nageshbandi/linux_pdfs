#!/bin/sh
# emp5.sh: Shows use of the while loop
#
answer=y        # Must set it to y first to enter the loop
while [ "$answer" = "y" ]     # The control command
do
    echo "Enter the code and description: \c" >/dev/tty
    read code description     # Read both together
    echo "$code|$description" >> newlist    # Append a line to newlist
    echo "Enter any more (y/n)? \c" >/dev/tty
    read anymore
    case $anymore in
         y*|Y*) answer=y ;;   # Also accepts yes, YES etc.
         n*|N*) answer=n ;;   # Also accepts no, NO etc.
             *) answer=y ;;   # Any other reply means y
    esac
done

