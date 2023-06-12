#!/usr/bin/perl
# Script: 3_numbers.pl - Splits a string on whitespace
#
print("Enter three numbers: " ) ;
chop($numstring = <STDIN>) ;
die("Nothing entered\n") if ($numstring eq "") ;
($f_number, $s_number, $l_number) = split(/ /, $numstring) ;
print("The last, second and first numbers are ") ;
print("$l_number, $s_number and $f_number.\n" ) ;
