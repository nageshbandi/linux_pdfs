#!/usr/bin/perl
# grep1.pl: Extracts the From: headers from the mailbox
#
while (<>) {                               # Actually ($_ = <>)
    chop() ;                               # chop($_)
    if (/From:.*\@velvet.com/) {           # if ($_ =~ /From:.*\@velvet ...)
        $slno++ ;
        print($slno . "  " . $_ . "\n") ;
    }
}

