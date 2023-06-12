#!/usr/bin/perl 
# Source: rep3.pl - Uses the s and tr functions for substitution 
#
print("Last two digits of date of birth: ");
$yearin = <STDIN> ;
chop($yearin);                 # Remove \n else comparison will fail later
  
$found = 0;
while (<>) {
   @line = split(/\|/) ;  
   $name = $line[1] ; $emp_id = $line[0] ; 
   split(/\//, $line[4]);             # Splits date field
   $year =  $_[2] ;                   # 2-digit year extracted ...
  
   if ($year eq $yearin)  {           # .. and compared with user input
       $found = 1;
       $name =~ tr/a-z/A-Z/ ;         # Name field changed to uppercase
       $emp_id =~ s/^/9/ ;            # Adds a "9" prefix to the first field
       $line[0] = $emp_id ;           # Reassign elements of @line with 
       $line[1] = $name;              # the two changes made by tr and s
       $_ = join(":", @line) ;        # Assigning to $_ allows use of next
                                      # two s functions without using =~
       s/\s+:/:/g ;                   # Removes whitespace before delimiter
       s#/#-#g ;                      # Delimiter in date is now the -
       print ;                        # Print $_
   }
}
print("Year 19" . $yearin . " not found\n") if $found eq 0 ;

