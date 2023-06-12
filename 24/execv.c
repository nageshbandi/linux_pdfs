/* Program: execv.c -- Stuffs all command line arguments to an array 
                       to be used with execv */
#include <stdio.h>
int main(int argc, char **argv) {
    char *cmdargs[] = { "grep", "-i", "-n", "SUMIT", "/etc/passwd", NULL };
    execv("/bin/grep", cmdargs);                /* Execute another program */
    printf("execv error\n");
}

