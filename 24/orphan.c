/* Program: orphan.c -- Creates an orphan by letting child sleep for 2 minutes
                        Parent doesn't call wait and dies immediately */
#include <stdio.h>
int main(void) {
   int pid; 
   if ((pid = fork()) > 0)       /* Parent */
      exit(10);                  /* Parent exits without calling wait */
   else if (pid == 0) {          /* Child */
      sleep(2);                  /* Lets parent die in this time frame */
      printf("CHILD: Adopted by init now, PPID: %d\n", getppid());
      exit(0);
   }
}
