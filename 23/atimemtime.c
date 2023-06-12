/* Program: atimemtime.c --
                         Sets a file's time stamps to those of another file */
#include <sys/stat.h>
#include <fcntl.h>
#include <utime.h>
  
void quit(char *, int);  
int main(int argc, char **argv) {
   struct stat statbuf;        /* To obtain time stamps for an existing file */
   struct utimbuf timebuf;     /* To set time stamps for another file */
  
    if (lstat(argv[1], &statbuf) == -1) 
       quit("stat", 1);
  
    timebuf.actime  = statbuf.st_atime;  /* Setting members of timebuf with */
    timebuf.modtime = statbuf.st_mtime;  /* values obtained from statbuf */
  
    if (open(argv[2], O_RDWR | O_CREAT, 0644) == -1)
       quit("open", 2);
    close(argv[2]);                 /* Previously used open only to create it */
  
    if (utime(argv[2], &timebuf) == -1)  /* Sets both time stamps for file */
       quit("utime", 3);                 /* that was just created */
    exit(0);
}

