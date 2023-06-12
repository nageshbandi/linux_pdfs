#!/usr/bin/perl -n
# Script: rep2.pl - Uppercases the name and adds century prefix to the date
#
@line = split(/\|/) ;                              # $_ is assumed
($day, $month, $year) = split(/\//, $line[4]);     # Splits date field
$year = "19" . $year ;                             # Adds century prefix
$line[4] = join("\/", $day, $month, $year);        # Rebuilds date field
$line = join("\|", @line);                         # Rebuilds line
print $line;

