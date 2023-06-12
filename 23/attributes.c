/* Program: attributes.c -- Uses lstat call and 
                            struct stat to display file attributes*/
#include <stdio.h>
#include <sys/stat.h>
  
void quit(char *, int);
  
int main(int argc, char **argv) {
   struct stat statbuf;                /* We'll use lstat to populate this */
    
   if (lstat(argv[1], &statbuf) == -1) 
      quit("Couldn't stat file", 1);
  
   printf("File: %s\n", argv[1]);
   printf("Inode number: %d \n", statbuf.st_ino);
   printf("UID: %d   ", statbuf.st_uid);
   printf("GID: %d\n", statbuf.st_gid);
   printf("Type and Permissions: %o\n",  statbuf.st_mode);
   printf("Number of links: %d \n", statbuf.st_nlink);
   printf("Size in bytes: %d\n", statbuf.st_size);
   printf("Blocks allocated: %d\n", statbuf.st_blocks);
   printf("Last Modification Time: %s", ctime(&statbuf.st_mtime));
   printf("Last Access Time: %s\n", ctime(&statbuf.st_atime));
   exit(0);
} 

