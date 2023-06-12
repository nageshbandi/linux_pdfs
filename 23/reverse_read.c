/* Program: reverse_read.c -- Reads a file in reverse - uses lseek  */
  
#include <fcntl.h>                      /* For O_RDONLY */
#include <unistd.h>                     /* For STDOUT_FILENO */
  
int main(int argc, char **argv) {
    char buf;                           /* Single-character buffer; will make */
    int size, fd;                       /* I/O inefficient. See Section 23.4 */
  
    fd = open(argv[1], O_RDONLY);
    size = lseek(fd, -1, SEEK_END);     /* Pointer taken to EOF - 1 ... */
    while (size-- >= 0) {               /* ... so size = file size - 1 */ 
       read(fd, &buf, 1);               /* Read one character at a time */
       write(STDOUT_FILENO, &buf, 1);   /* and write it immediately */
       lseek(fd, -2, SEEK_CUR);         /* Now move file pointer back */
    }                                   /* by two characters */
    /* exit(0); */                      /* Done deliberately */
}

