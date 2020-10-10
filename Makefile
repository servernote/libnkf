CC		=	gcc
#CC_DBG	+=	-g
CC_OPT	+=
CC_INC	+=
CFLAGS	+=	$(CC_OPT) $(CC_DBG) $(CC_INC)
DESTLIB	=	/usr/local/lib
DESTINC	=	/usr/local/include

all:	libnkf.a libnkf.so.1.0

libnkf.oa:	libnkf.c libnkf.h
	$(CC) $(CFLAGS) -o $@ -c $<

libnkf.os:	libnkf.c libnkf.h
	$(CC) $(CFLAGS) -fPIC -o $@ -c $<

libnkf.a:	libnkf.oa
	ar rv $@ $?
	ranlib $@

libnkf.so.1.0:	libnkf.os
	$(CC) -shared -Wl,-soname,libnkf.so.1 -o libnkf.so.1.0 $?

clean:
	rm -f *.o* *.a *.so*

install:	all
	install libnkf.a $(DESTLIB)
	install libnkf.so.1.0 $(DESTLIB)
	ldconfig $(DESTLIB)
	ln -f -s -r $(DESTLIB)/libnkf.so.1 $(DESTLIB)/libnkf.so
	install -m 0644 libnkf.h $(DESTINC)
