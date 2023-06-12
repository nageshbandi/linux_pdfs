#!/usr/bin/perl
# Script: rw.pl -  Shows use of low-level I/O available in perl
#
open(FILEIN, "desig.lst") || die("Cannot open file") ;
open(FILEOUT, ">desig_out.lst") ;
while (<FILEIN>) {                       # As long there are lines in the file
    print FILEOUT if (1..3) ;            # Can also use if ($. < 4 )
}
close(FILEIN) ;
close(FILEOUT) ;

