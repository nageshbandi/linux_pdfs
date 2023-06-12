/* Program: wait.c -- Uses wait to obtain child's termination status.
                      The WEXITSTATUS macro fetches the exit status. */
#include <stdio.h>
#include <fcntl.h>
#include <sys/wait.h>
  
int main(int argc, char **argv) {
   int fd, exitstatus;
   int exitval = 10;             /* Value to be returned by child */
  
   fd = open(argv[1], O_WRONLY | O_CREAT | O_TRUNC, 0644);
   write(fd, "Original process writes\n", 24);     /* First write */
  
   switch(fork()) {  
      case 0:
         write(fd, "Child writes\n", 13);          /* Second write */
         close(fd);              /* Closing here doesn't affect parent's copy */
         printf("CHILD: Terminating with exit value %d\n", exitval); 
         exit(exitval);          /* Can also use _exit(exitval) */
  
      default:
         wait(&exitstatus);      /* Waits for child to die */
         printf("PARENT: Child terminated with exit value %d\n", 
                WEXITSTATUS(exitstatus));         /* Extracting exit status */
         write(fd, "Parent writes\n", 14);         /* Third write */
         exit(20);               /* Value returned to shell; try echo $? */
   }
}

