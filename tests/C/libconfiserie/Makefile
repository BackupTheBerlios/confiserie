ifndef CONFISERIE_DEBUG
MAKEFLAGS += s
endif
noinst_LIBRARIES += libconfiserie
libconfiserie_SOURCES =  libconfiserie.c  libconfiserie2.c
libconfiserie_VERSION =  0.0.0

noinst_PROGRAMS = testlibconfiserie
testlibconfiserie_SOURCES = testlibconfiserie.c
testlibconfiserie_LDADD   = -lconfiserie-0 -L./GENERATED
testlibconfiserie_DEPEND  = libconfiserie


include ${confiserie}/Makefiles/Makefile.autolib
include ${confiserie}/C/Makefile.autoapp
include ${confiserie}/C/Makefile.beautifull_rules

