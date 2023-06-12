#!/usr/bin/perl
# Script: region.pl - Uses an associative array
#
%region = ("N", "North", "S", "South", "E", "East", "W", "West") ;
foreach $letter (@ARGV) {
   print("The letter $letter stands for $region{$letter}" . "\n" );
}
@key_list = keys(%region) ;                              # List of subscripts
print("The subscripts are @key_list\n") ;
@value_list = values %region  ;                          # List of values
print("The values are @value_list\n") ;

