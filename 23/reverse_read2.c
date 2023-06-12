/* Program: reverse_read2.c -- Reads a file in reverse - uses error handling  */
  
#include <fcntl.h>                  /* For O_RDONLY */
#include <unistd.h>                 /* For STDOUT_FILENO */
#include <errno.h>                  /* For ENOENT, errno, etc. */
#include <stdio.h>                  /* For ENOENT, errno, etc. */
  
int main(int argc, char **argv) {
    int size, fd;
    char buf;                                /* Single-character buffer */
    char *mesg = "Not enough arguments\n";
  
    if (argc != 2) {               /* Our own user-defined error message */
       write(STDERR_FILENO, mesg, strlen(mesg));  /* Crude form of error */
       exit(1);                                   /* handling using write */
    }                                             /* Use fprintf instead */
  
    if ((fd = open(argv[1], O_RDONLY)) == -1) {
       if (errno == ENOENT) {                   / *Checking for specific error*/
          fprintf(stderr, "%s\n", strerror(errno)); /* perror is better */
          exit(2);
       } else {
          perror(argv[1]);                 /* Using two library functions */
          exit(3);                         /* perror and exit. Often the */
       }                                   /* preferred way */
    }
  
    lseek(fd, 1, SEEK_END);                /* Pointer taken to EOF + 1 first */
    while (lseek(fd, -2, SEEK_CUR) >= 0) { /* and then back by two bytes */ 
       if (read(fd, &buf, 1) != 1) {       /* A signal can create error here */
          perror("read");                    
          exit(4);
       }
       if (write(STDOUT_FILENO, &buf, 1) != 1) { /* Disk may run out of space */
          perror("write");
          exit(5);
       }
    }              
    close(fd);                        /* Can have error here too */
    exit(0);                          /* exit doesn't return - hence no error */
}

