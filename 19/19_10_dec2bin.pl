#!/usr/bin/perl
# Script: dec2bin.pl - Converts decimal numbers to binary
#
foreach $number (@ARGV) {
    $original_number = $number ;
    until ($number == 0 ) {
        $bit = $number % 2  ;                   # Find the remainder bit
        unshift (@bit_arr, $bit) ;              # Insert bit at beginning
        $number = int($number / 2 ) ;
    }
    $binary_number = join ("", @bit_arr) ;      # Join on nothing!
    print("The binary number of $original_number is $binary_number\n") ;
    $#bit_arr = -1 ;                            # Deletes all array elements
}

