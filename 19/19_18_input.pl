#!/usr/bin/perl
# Script: input.pl - Shows use of subroutines
#
system("tput clear") ;                   # Executes the UNIX command
$username = &take_input("Oracle user-id: ") ;
$password = &take_input("Oracle password: ", "noecho") ;
print "\nThe username and password are $username and $password\n" ;
  
sub take_input {
   my ($prompt, $flag) = @_ ;              # @_ stores arguments of subroutine
   while (1)  {                            # (1) is always true
      print("$prompt") ;
      system("stty -echo") if (@_ == 2 ) ;                  # Echo mode off
      chop($name = <STDIN>) ;
      system("stty echo") if (@_ == 2 ) ;                   # Echo mode on
      last if $name =~ /\w/ ;              # Quit the loop if $name has at
   }                                       # least one word character
   $name ;                                 # return $name will also do
}

