#!/usr/bin/perl
# Script: when_last.pl - Finds files that are less than 2.4 hours old
#
foreach $file (`ls`)  {
  chop($file) ;
  if (($m_age = -M $file) < 0.1) {          # tenth of a day i.e., 2.4 hours
     printf "File %s was last modified %0.3f days back \n", $file, $m_age ;
  }
}

