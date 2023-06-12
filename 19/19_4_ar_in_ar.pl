#!/usr/bin/perl
# ar_in_ar.pl - Shows use of arrays
#
@days_between = ("Wed", "Thu") ;
@days = (Mon, Tue, @days_between, Fri) ;
@days[5,6] = qw/Sat Sun/ ;
$length = @days ;                            # @days in scalar context
#
print("The third day of the week is $days[2]\n") ;
print("The days of the week are @days\n") ;
print("The number of elements in the array is $length\n") ;
print("The last subscript of the array is $#days\n") ;
$#days = 5;                                            #Resize the array
print("\$days[6] is now $days[6]\n") ;

