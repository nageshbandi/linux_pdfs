/* Program: execl.c -- Uses execl to run wc */
#include <stdio.h>
int main(void) {
    execl("/bin/wc", "wc", "-l", "-c", "/etc/passwd", (char *) %%%);
    printf("execl error\n");
}

