#/***********************************************************************
#* copyright (c) 2004 MALET Jean-luc aka cityhunter
#* This program is free software; you can redistribute it and/or modify
#* it under the terms of the artistic license as published in the top source dir of the
#* package
#************************************************************************/

.PHONY : all install clean distclean

include Makefile.confiserie

all : install

Makefile.confiserie :
	./configure

install :	CONFDIR=$(SHARED_DATA_DIR)/confiserie 
install :	INST_CONFDIR=$(DESTDIR)$(CONFDIR)
install :
	mkdir -p $(DESTDIR)$(SYS_CONF)
	rm -f $(DESTDIR)$(SYS_CONF)/confiserie.conf
	echo "CONFISERIE_SCRIPTS_DIR=$(CONFDIR)" > $(DESTDIR)$(SYS_CONF)/confiserie.conf
	################
	mkdir -p $(INST_CONFDIR)
	cp -Rp tests $(INST_CONFDIR)
	cp -p README $(INST_CONFDIR)
	cp -Rp make_templates $(INST_CONFDIR)
	cp -Rp doc $(INST_CONFDIR)
	###############
	mkdir -p $(DESTDIR)$(BIN_DIR)
	install -c napper $(DESTDIR)$(BIN_DIR)
	IFS=$$'\n';	rm -rf $$(find ${INST_CONFDIR} -name .svn)
	
clean :

distclean : clean
	rm Makefile.confiserie
