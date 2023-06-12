#!/usr/bin/perl
# square_root.pl - Finds the square root of each command line argument
#
print("The program you are running is $0\n") ;
foreach $number (@ARGV) {            # Each element of @ARGV goes to $number
     print("The square root of $number is " . sqrt($number) . "\n") ;
}

