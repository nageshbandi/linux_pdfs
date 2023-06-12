/* Program: check_all_perm.c -- Checks all 12 permission bits of a file */
  
#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
  
void print_permissions(char *, struct stat *) ;
void check_permission(int, int, char *);
  
int main(int argc, char *argv[]) {
   int i, fd, perm;
   char *filename = argv[1];
   struct stat statbuf;
   mode_t perm_flag[] = {S_IRUSR, S_IWUSR, S_IXUSR, S_IRGRP, S_IWGRP, S_IXGRP,
                         S_IROTH, S_IWOTH, S_IXOTH, S_ISUID, S_ISGID, S_ISVTX };
  
   char *mesg[] = {"User-readable", "User-writable", "User-executable",
                   "Group-readable", "Group-writable", "Group-executable",
                   "Others-readable", "Others-writable", "Others-executable",
                   "SUID bit set", "SGID bit set", "Sticky bit set" };
  
   print_permissions(filename, &statbuf);
  
   perm = statbuf.st_mode & ~S_IFMT; 
   for (i = 0; i < 12; i ++)
      check_permissions(perm, perm_flag[i], mesg[i]);
}

