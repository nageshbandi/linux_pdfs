#!/bin/sh
# filetest.sh: Tests file attributes
#
if [ ! -e $1 ] ; then
    echo "File does not exist"
elif [ ! -r $1 ] ; then
    echo "File is not readable"
elif [ ! -w $1 ] ; then
    echo "File is not writable"
else
    echo "File is both readable and writable"
fi
