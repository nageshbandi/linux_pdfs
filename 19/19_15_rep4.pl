#!/usr/bin/perl -n
# Script: rep4.pl - Reports a date in format dd-mon-yyyy using a TRE
#
@month[1..12] = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                 "Jul", "Aug", "Sep", "Oct", "Nov", "Dec") ;
split (/\|/) ;          # 
$_[4] =~ /(\d+).(\d+).(\d+)/ ;  # Splits up into $1, $2 and $3
$_[4] = join ("-", $1, $month[$2], "19$3") ;
$_ = join(":", @_);
print ;

