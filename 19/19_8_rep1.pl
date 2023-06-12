#!/usr/bin/perl
# Script: rep1.pl - Uses split twice; prints with first and last name reversed
#
while (<>) {    
   chop;
   @field = split (/\|/) ;   # $_ is used by default
   if (1..4) {             # Lines 1 to 4
       $dept = $field[3] ; $name = $field[1] ; $salary = $field[5] ;
       ($f_name, $l_name) = split(/ +/, $name);
       $name = $l_name . ", " . $f_name ;     # Reusing $name
       $totsal += $salary ;
       printf( "%3d %-20s %-11s %4d\n", $., $name, $dept, $salary) ;
   }
}
printf("%35s %5d\n", "Total Salary: ", $totsal) ;
