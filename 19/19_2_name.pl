#!/usr/bin/perl
# Script: name.pl - Demonstrates use of chop
#
print("Enter your name: ") ;
$name = <STDIN> ;
chop($name) ;                        # Removes newline character from $name
if ( $name ne "" ) {
    print("$name, have a nice day\n") ;
} else {
    print("You have not entered your name\n") ;
}
