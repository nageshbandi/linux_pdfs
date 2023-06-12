/* Program: exec_and_fork.c.c -- 
            Uses fork, exec and wait to run a UNIX command */
#include <stdio.h>
#include <wait.h>
  
int main(int argc, char **argv) {
    int returnval ;                  /* Used by wait */
  
    switch(fork()) {
       case 0:                       /* Run command in child */
           if ((execv(argv[1], &argv[2]) < 0)) {
               fprintf(stderr, "execl error\n");
               exit(200);       
           }
      default:                       /* In the parent */
           wait(&returnval);         /* After the command has completed ... */
           fprintf(stderr, "Exit status: %d\n", WEXITSTATUS(returnval));
           exit (0);
    }                             
}                                

