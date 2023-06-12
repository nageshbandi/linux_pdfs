BEGIN { 
   FS = "|"
   printf "%46s\n", "Basic    Da   Hra Gross"
} /sales|marketing/ {
   # Calculate the da, hra and the gross pay
   da = 0.25*$6 ; hra = 0.50*$6 ; gp = $6+hra+da
  
   # Store the aggregates in separate arrays
   tot[1] += $6 ; tot[2] += da ; tot[3] += hra ; tot[4] += gp
   kount++
}
END { # Print the averages
   printf "\t     Average   %5d %5d %5d %5d\n", \
   tot[1]/kount, tot[2]/kount, tot[3]/kount, tot[4]/kount
}
