# Makefile containing redundancies
rec_deposit: rec_deposit.o arg_check.o quit.o                # Rule 1
	cc -o rec_deposit rec_deposit.o arg_check.o quit.o -lm
  
rec_deposit.o: rec_deposit.c quit.h arg_check.h              # Rule 2
	cc -c rec_deposit.c
  
quit.o: quit.c quit.h                                        # Rule 3
	cc -c quit.c
  
arg_check.o: arg_check.c arg_check.h                         # Rule 4

