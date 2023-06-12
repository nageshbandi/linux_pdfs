#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>
void print_permissions(char *fname, struct stat *addbuf) {
    if (lstat(fname, addbuf) < 0) {
        perror("stat");
        exit(1);
    } else 
        printf("File: %s  Permissions: %o\n", fname, addbuf->st_mode & ~S_IFMT);
}

