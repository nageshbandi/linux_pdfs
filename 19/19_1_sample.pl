#!/usr/bin/perl
# Script: sample.pl - Shows use of variables
#
print("Enter your name: ") ;
$name = <STDIN> ;                                  # Input from the keyboard
print("Enter a temperature in Centigrade: ") ;
$centigrade=<STDIN> ;                              # Whitespace unimportant
$fahrenheit=$centigrade*9/5 + 32 ;                 # Here too
print "The temperature $name in Fahrenheit is $fahrenheit\n" ;

