#!/bin/sh
# dentry1.sh: Data entry script - Runs in a loop
#
trap 'echo Not to be interrupted' INT        # [Ctrl-c] won't work
trap 'echo Signal received ; exit' HUP TERM  # but these two signals will
file=desig.lst                     # The file that is looked up and appended to

while echo "Designation code: \c"  >/dev/tty ; do
    read desig
    case "$desig" in             # First check if the code exists
    [0-9][0-9]) if grep "^$desig" $file >/dev/null ; then  
                    echo "Code exists" 
                    continue        # Go to loop beginning
                fi ;;
             *) echo "Invalid code" 
                continue ;;
    esac
  
    while echo "Description     : \c"  >/dev/tty ; do
         read desc
         case "$desc" in
     *[!\ a-zA-Z]*) echo "Can contain only alphabets and spaces"  >/dev/tty
                    continue ;;        # Go to inner loop beginning
                "") echo "Description not entered"  >/dev/tty
                    continue ;;
                 *) echo "$desig|$desc"
                    break              # Terminate this inner loop
         esac
    done >> $file                   # Appends to same file that is looked up
  
    echo "\nWish to continue? (y/n): \c"  
    read answer
    case "$answer" in
         [yY]*) continue ;;          # Go to outer loop beginning
             *) break ;;             # Terminate outer loop
    esac
done
  
echo "Normal exit"
