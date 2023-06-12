#!/usr/bin/perl
# Script: search_array.pl - Searches array for a string or regular expression 
#
@dept_arr = <> ;                        # Read file into array
for ($i=0 ; $i<3 ; $i++) {              # Can use only three times
    print("Enter a code to look up: ") ;
    chop($code = <STDIN>) ;
    @found_arr = grep (/^$code/, @dept_arr) ;          # Search at beginning
    if ($#found_arr == -1 || $code eq "") {            # -1 means null array
        print("Code does not exist\n") ;
        next ;                          # Go to beginning of loop
    }
    split(/\|/, $found_arr[0]) ;        # Split first element only
    print("Code = $code    Description = $_[1]\n") ;
}

