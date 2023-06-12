/* Program: signal2.c -- Handles SIGINT and SIGTSTP generated from terminal 
                         Requires two [Ctrl-c]s to terminate */ 
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
  
void quit(char *message, int exit_status) ;
void tstp_handler(int signo);            /* Handler for [Ctrl-z] */
void int_handler(int signo);             /* Handler for [Ctrl-c] */
int n, count = 0;
  
int main(void) {
    signal(SIGTSTP, tstp_handler);       /* Disposition for these two signals */
    signal(SIGINT, int_handler);         /* set to enter respective handlers */
    signal(SIGQUIT, SIG_IGN);            /* Disposition set to ignore */
  
    fprintf(stderr, "Press [Ctrl-z] first, then [Ctrl-c]\n");
    for (;;) 
       pause();                          /* Will return on receipt of signal */
}
  
void tstp_handler(int signo) {
    signal(SIGTSTP, tstp_handler);                  /* Not entirely reliable */ 
    fprintf(stderr, "Can't stop this program\n");   /* same signal can reset */ 
}                                                   /* disposition to default */
  
void int_handler(int signo) {                       /* Will terminate program */
    signal(SIGINT, int_handler);                    /* on second invocation */
    (++count == 1) ? printf("Press again\n") : quit("Quitting", 1); 
}

