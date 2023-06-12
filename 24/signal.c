/* Program: signal.c -- Waits for 5 seconds for user input and then 
                        generates SIGALRM that has a handler specified */
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#define BUFSIZE 100
  
void alrm_handler(int signo);               /* Prototype declarations for */
void quit(char *message, int exit_status); /* signal handler and quit */
  
char buf[BUFSIZE] = "foo\0";                /* Global variable */
int main(void) {
    int n;
    if (signal(SIGALRM, alrm_handler) == SIG_ERR)   /* signal returns SIG_ERR */
        quit("sigalrm", 1);                         /* on error */
  
    fprintf(stderr, "Enter filename: ");
    alarm(5);                               /* Sets alarm clock; will deliver */
    n = read(STDIN_FILENO, buf, BUFSIZE);   /* SIGALRM in 5 seconds */
    if (n > 1)                              /* Will come here if user inputs */
        printf("Filename: %s\n", buf);      /* string within 5 seconds */
    exit(0);
}
  
void alrm_handler(int signo) {       /* Invoked with process receives SIGALRM */
    signal(SIGALRM, alrm_handler);   /* Resetting signal handler */
    fprintf(stderr, "\nSignal %d received, default filename: %s\n", signo, buf);
    exit(1);
}

