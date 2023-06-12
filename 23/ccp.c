/* Program: ccp.c -- Copies a file with the read and write system calls */
  
#include <fcntl.h>             /* For O_RDONLY, O_WRONLY, O_CREAT etc. */
#include <sys/stat.h>          /* For S_IRUSR, S_IWUSR, S_IRGRP etc. */
#define BUFSIZE 1024           /* May not be the right size here */
  
int main(void) {
    int fd1, fd2;              /* File descriptors for read and write */
    int n;                     /* Number of characters returned by read */
    char buf[BUFSIZE];         /* BUFSIZE should be carefully chosen */

    fd1 = open("/etc/passwd", O_RDONLY);
    fd2 = open("passwd.bak", O_WRONLY | O_CREAT | O_TRUNC, 
               S_IRUSR | S_IWUSR | S_IRGRP |S_IWGRP | S_IROTH);   /* Mode 664 */
  
    while ((n = read(fd1, buf, BUFSIZE)) > 0)   /* Return value of read is */
        write(fd2, buf, n) ;                    /* used by write as argument */
  
    close(fd1);
    close(fd2);
    exit(0);                 /* This would have closed all file descriptors */
}

