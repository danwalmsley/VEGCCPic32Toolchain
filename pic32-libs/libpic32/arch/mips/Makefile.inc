_VPATH	+=:$(ROOT)/arch/mips

LIBOBJ	+= setjmp.o _sync.o _xchsrspss.o  _xxc0.o
#LIBOBJ += gmon.o

ifndef CODESIZEOPT
LIBOBJ	+= memcmp.o memcpy.o memset.o
LIBOBJ	+= strcmp.o strcpy.o strlen.o
endif

LIBOBJ	+= mulsi.o mulsidi.o multab.o divsi.o

CFLAGS= -I$(ROOT)/include -I$(ROOT)../include
ASFLAGS= -I$(ROOT)/include -I$(ROOT)../include

setjmp.o: $(ROOT)/arch/mips/setjmp.S
	$(CC) $(CFLAGS) -c $< -o $@

ifndef CODESIZEOPT
memcmp.o: $(ROOT)/arch/mips/memcmp.S
	$(CC) $(CFLAGS) -c $< -o $@
memcpy.o: $(ROOT)/arch/mips/memcpy.S
	$(CC) $(CFLAGS) -c $< -o $@
memset.o: $(ROOT)/arch/mips/memset.S
	$(CC) $(CFLAGS) -c $< -o $@
strcmp.o: $(ROOT)/arch/mips/strcmp.S
	$(CC) $(CFLAGS) -c $< -o $@
strcpy.o: $(ROOT)/arch/mips/strcpy.S
	$(CC) $(CFLAGS) -c $< -o $@
strlen.o: $(ROOT)/arch/mips/strlen.S
	$(CC) $(CFLAGS) -c $< -o $@
endif

_xchsrspss.o: $(ROOT)/arch/mips/_xchsrspss.sx
	$(CC) $(CFLAGS) -c $< -o $@
_xxc0.o: $(ROOT)/arch/mips/_xxc0.sx
	$(CC) $(CFLAGS) -c $< -o $@

