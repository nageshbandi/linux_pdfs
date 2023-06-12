#!/bin/sh
# emp6.sh -- Using a for loop with positional parameters
#
for pattern in "$@" ; do              # Decided not to use $* - Section 14.7.2
   grep "$pattern" emp.lst || echo "Pattern $pattern not found"
done
