/* Program: dir.c -- Directory navigation with chdir and getcwd */
  
#include <stdio.h>
#define PATH_LENGTH 200
  
void quit(char *, int);                      /* Prototype definition */
  
int main(int argc, char **argv) {
    char olddir[PATH_LENGTH + 1];            /* Extra character for null */
    char newdir[PATH_LENGTH + 1];
    
    if (getcwd(olddir, PATH_LENGTH) == -1)   /* Getting current directory */
        quit("getcwd", 1);
    printf("pwd: %s\n", olddir);
  
    if ((chdir(argv[1]) == -1))              /* Changing to another directory */
        quit("chdir", 2);
    printf("cd: %s\n", argv[1]);
  
    getcwd(newdir, PATH_LENGTH);             /* Getting new directory */
    printf("pwd: %s\n", newdir);
    exit(0);
}

