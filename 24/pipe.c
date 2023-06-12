/* Program: pipe.c -- Shares a pipe between two processes.
                      We want the data to flow from the parent to the child */
#include <stdio.h>
#include <unistd.h>
  
void quit(char *, int);
int main(void) {
   int n, fd[2];                           /* fd[2] to be filled up by pipe() */
   char buf[100];                          /* Buffer to be used by read() */
  
   if (pipe(fd) < 0)                       /* fd[0] is read end */
      quit("pipe", 1);                     /* fd[1] is write end */
     
   switch (fork()) {                       /* Pipe has four descriptors now */
       case -1: quit("Fork error", 2);
        case 0: close(fd[1]);              /* CHILD-Close write end of pipe */
                n = read(fd[0], buf, 100); /* and read from its read end */  
                write(STDOUT_FILENO, buf, n);
                break;
       default: close(fd[0]);              /* PARENT-Close read end of pipe */
                write(fd[1], "Writing to pipe\n", 16); /* write to write end */
   }
   exit(0);
}

