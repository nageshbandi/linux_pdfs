/* Program: umask.c -- Changes umask twice and checks effect on permissions */
  
#include <stdio.h>
#include <fcntl.h>
  
int main(void) {
   mode_t old_mode, new_mode;
  
   old_mode = umask(0);                        /* No mask */
   printf("Previous umask value: %o\n", old_mode);
  
   open("foo1", O_RDONLY | O_CREAT, 0777);     /* Create file using new mask */
   umask(old_mode);                            /* Revert to previous mask */
   open("foo2", O_RDWR | O_CREAT, 0764);       /* Create file using old mask */
   exit(0);
}
