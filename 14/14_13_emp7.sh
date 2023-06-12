#!/bin/sh
# emp7.sh: Script using shift -- Saves first argument; for works with rest
#
case $# in
    0|1) echo "Usage: $0 file pattern(s)" ; exit 2 ;;
      *) flname=$1     # Store $1 as a variable before it gets lost
         shift
         for pattern in "$@" ; do       # Starts iteration with $2
             grep "$pattern" $flname || echo "Pattern $pattern not found"
         done ;;
esac
