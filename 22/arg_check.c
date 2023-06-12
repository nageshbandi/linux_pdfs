#include "arg_check.h"
void arg_check (int args, int argc, char *message, int exit_status) {
   if (argc != args) {
       fprintf(stderr, message);
       exit(exit_status);
   }
}

