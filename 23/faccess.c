/* Program: faccess.c --
            Determines a file's access rights using the read UID and GID */
#include <unistd.h>
#include <stdio.h>
  
void quit(char *, int);
int main(int argc, char *argv[]) {
   short count;
   for (count = 1; count < argc; count++) {
      printf("%s: ", argv[count]);
  
      if (access(argv[count], F_OK) == -1)
         quit("File not found", 1);
      if (access(argv[count], R_OK) == -1 )
         printf("Not readable  ");
      if (access(argv[count], W_OK) == -1)
         printf("Not writable  ");
      if (access(argv[count], X_OK) == -1)
         printf("Not executable  ");
  
      printf("\n");
   }
   exit(0);
}

