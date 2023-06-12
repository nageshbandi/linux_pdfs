/* Program: show_errno.c -- Displaying system call errors with perror */
  
#include <fcntl.h>
  
int main(int argc, char **argv) {
   int fd;
   char* filename = "non_existent_file";  /* This file must not exist */
    
   fd = open(filename, O_RDONLY);         /* File descriptor assigned first */
   if (fd == -1)                          /* and then checked */
      perror("non_existent_file");
   if ((fd = open("/etc/shadow", O_RDONLY)) == -1)   /* Both combined here */
      perror("shadow");
   if ((fd = open("show_errno.c", O_WRONLY | O_CREAT | O_EXCL, 0744)) == -1) 
      perror("show_errno.c");
   exit(0);
}
