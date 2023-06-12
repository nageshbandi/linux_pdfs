/* Program: show_errors.c -- Uses strerror to print all error messages */
  
#include <stdio.h>
  
int main(void) {
    int i;
    extern int sys_nerr;              /* Total number of error messages */
  
    for (i =0; i < sys_nerr; i++)
        printf("%d: %s\n", i, strerror(i));
    printf("Number of errors available: %d\n", sys_nerr);
    exit(0);
}
