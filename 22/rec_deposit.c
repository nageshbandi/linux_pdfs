#include <math.h>
#include "quit.h"
#include "arg_check.h"
  
float compute(float, float, float);         /* Declaring function prototype */
  
int main(int argc, char **argv) {
    float principal, interest, term, sum ;
    char *mesg = "Three arguments required\n" ;
    char *mesg2 = "All arguments must be positive\n" ;
    arg_check(4, argc, mesg, 1);          /* Checks for three arguments */
    sscanf(argv[1], "%f", &principal);    /* Converting strings to float */
    sscanf(argv[2], "%f", &interest);  
    sscanf(argv[3], "%f", &term); 
    if (principal <= 0 || interest <= 0 || term <= 0)
        quit(mesg2, 2);                  /* Quits with 2 as $? on error */
    sum = compute(principal, interest, term);  /* Function declared here */
    printf("Maturity amount: %f\n", sum );
    exit(0);
}
  
float compute(float principal, float interest, float term) {
    int i;
    float maturity = 0;
    interest = 1 + interest / 100 ;
    for (i = 1 ; i <= term ; i++)
       maturity += principal * pow(interest, i) ; 
    return maturity;
}

