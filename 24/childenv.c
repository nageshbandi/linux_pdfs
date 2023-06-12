/* Program: childenv.c -- Changes child's environment and then checks 
                          the effect in parent */
#include <stdio.h>
#include <sys/types.h>
#define PATH_LENGTH 30
  
int main(void) {
   pid_t pid;
   int x = 100;
   char newdir[PATH_LENGTH + 1];    /* Additional space required for \0 */
  
   getcwd(newdir, PATH_LENGTH);     /*Get current directory before fork */
   printf("BEFORE FORK -- Current directory: %s\n", newdir); 
  
   pid = fork (); 
   switch (pid) {
      case -1:
         perror("fork");                              /* fork error */
         exit(1);                                     /* Parent exits */
      case 0:    /* Child */
         printf("CHILD -- Inherited value of x: %d\n", x); 
         x = 200 ;                                    /* Change x in child */
         printf("CHILD -- Changed value of x: %d\n", x); 
         printf("CHILD -- Inherited value of PATH: %s\n", getenv("PATH")); 
         setenv("PATH", ".", 1);  /* Change PATH here; use putenv("PATH=.") */
                                  /* if setenv() not supported */
         printf("CHILD -- New value of PATH: %s\n", getenv("PATH")); 
         if (chdir("/etc") != -1) {                   /* "cd" to /etc */
             getcwd(newdir, PATH_LENGTH);             /* Do a "pwd" */
             printf("CHILD -- Current directory changed to: %s\n", newdir); 
         }
         break;
         exit(0);
      default:   /* Parent */
         sleep(2);                                 /* Allow child to complete */
         getcwd(newdir, PATH_LENGTH);              /*Getting new directory */
         printf("PARENT -- Value of x after change by child: %d\n", x); 
         printf("PARENT -- Current directory is still: %s\n", newdir); 
         printf("PARENT -- Value of PATH is unchanged: %s\n", getenv("PATH")); 
         exit(0);
   }
}

