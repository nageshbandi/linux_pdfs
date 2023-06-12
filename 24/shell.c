/* Program: shell.c -- Accepts user input as a command to be executed. Uses 
                       the strtok library function for parsing command line */
#include <stdio.h>
#include <unistd.h>
#include <string.h>                   /* For strtok */
#include <wait.h>
  
#define BUFSIZE 200                   /* Maximum size of command line */
#define ARGVSIZE 40                   /* Maximum number of arguments */
#define DELIM "\n\t\r "               /* White-space delimiters for strtok */
  
int main(int argc, char **argv) {
    int i, n ;
    char buf[BUFSIZE+1];              /* Stores the entered command line */
    char *clargs[ARGVSIZE];           /* Stores the argument strings */
    int returnval ;                   /* Used by wait */
    for (;;) {                        /* Loop forever */
        n = 1;
        write(STDOUT_FILENO, "Shell> ", 7);  /* Display a prompt */
        read(STDIN_FILENO, buf, BUFSIZE);    /* Read user input into buf */
        if (!strcmp(buf, "exit\n"))           
            exit(0);                         /* Terminate if user enters exit */
                                             /* Now parse buf to extract the */
        clargs[0] = strtok(buf, DELIM);      /* first word */
                                             /* Continue parsing until ... */
        while ((clargs[n] = strtok(NULL, DELIM)) != NULL) 
            n++;                             /* ... all words are extracted */
  
        clargs[n] = NULL;             /* Set last argument pointer to NULL */
        switch(fork()) {
           case 0:                    /* Run command in child */
               if ((execvp(clargs[0], &clargs[0])) < 0)
                   exit(200);         /* We'll check this value later */
           default:                    /* In the parent */
               wait(&returnval);       /* After the command has completed ... */
               printf("Exit status of command: %d\n", WEXITSTATUS(returnval));
               for (i = 0; i <=n; i++) /* ... initialize both ... */
                   clargs[i] = "\0";   /* the argument array  ... */
               for (i = 0; i <BUFSIZE+1; i++)
                   buf[i] = '\0';      /* .... and buffer that stores command */
        }                              /* line, so next command can work with */
    }                                  /* an initialized buffer and argument */
}                                      /* array. */

