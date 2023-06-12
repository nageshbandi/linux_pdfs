/* Program: pipe2.c -- Runs two programs in a pipeline
                       Child runs cat, parent runs tr */
#include <unistd.h>
#include <stdio.h>
  
void quit(char *message, int exit_status) ;
int main(void) {
   int fd[2];                           /* To be filled up by pipe() */
  
   if (pipe(fd) < 0)                    /* Now have four descriptors for pipe */
      quit("pipe", 1);
   switch (fork()) {
      case -1: quit("fork", 2); 
  
       case 0: close(fd[0]);                /* CHILD - Close read end first */
               dup2(fd[1], STDOUT_FILENO);  /* Connect stdout to  write end */
               close(fd[1]);                /* and close original descriptor */
               execlp("cat", "cat", "/etc/hosts.equiv", (char *) 0);
               quit("cat", 3);   
  
      default: close(fd[1]);                /* PARENT - Close write end first */
               dup2(fd[0], STDIN_FILENO);   /* Connect stdin to read end */
               close(fd[0]);                /* and close original descriptor */
               execlp("tr", "tr", "'[a-z]'","'[A-Z]'", (char *) 0);
               quit("tr", 4);
   }
}

