/* Program: lls.c -- Uses readdir to populate a dirent structure */
  
#include <dirent.h>
#include <stdio.h>
  
int main(int argc, char **argv) {
    DIR *dir;                                  /* Returned by opendir */
    struct dirent *direntry;                   /* Returned by readdir */
  
    if ((dir = opendir(argv[1])) == NULL)      /* Directory must exist and */
        quit("opendir", 1);                    /* have read permission */
  
    while ((direntry = readdir(dir)) != NULL)  /* Till there are entries */ 
        printf("%10d %s\n", direntry->d_ino, direntry->d_name);
  
    closedir(dir);
    exit(0);
}

