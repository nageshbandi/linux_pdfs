BEGIN { 
   printf "\t\tEmployee abstract\n\n"
} $6 > 7500 {      # Increment the variables for the serial number and the pay
   kount++ ; tot+= $6    # Multiple assignments in one line
   printf "%3d %-20s %-12s %d\n", kount,$2,$3,$6
}
END { 
   printf "\n\tThe average basic pay is %6d\n", tot/kount
}
