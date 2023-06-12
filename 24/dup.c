/* Program: dup.c -- Uses dup to achieve both input and output redirection 
                     Closes standard streams first before using dup */
#include <unistd.h> 
#include <stdio.h> 
#include <sys/stat.h> 
#include <fcntl.h>
#define MODE6OO (S_IRUSR | S_IWUSR)
  
int main(int argc, char **argv) {
    int fd1, fd2;
    fd1 = open(argv[1], O_RDONLY);
    fd2 = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, MODE6OO);
  
    close(STDIN_FILENO);
    dup(fd1);                     /* This should return descriptor 0 */
    close(STDOUT_FILENO);
    dup(fd2);                     /* This should return descriptor 1 */
  
    execvp(argv[3], &argv[3]);    /* Execute any filter */
    printf("Failed to exec filter");
}

