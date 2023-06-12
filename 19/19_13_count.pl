#!/usr/bin/perl
# Script: count.pl - Counts frequency of occurrence of an item
#
while (<>) {
   split(/\|/) ;                          # | has to be escaped
   $dept = $_[3] ;                        # Department is fourth field
   $deptlist{$dept} += 1 ;                # Same as ++
}
foreach $dept (sort (keys %deptlist)) {
   print("$dept: $deptlist{$dept}\n") ;
}

