#some tweaks
export confiserie?=../../tests
#/***********************************************************************
#* copyright (c) 2004-2005 MALET Jean-luc aka cityhunter
#* This program is free software; you can redistribute it and/or modify
#* it under the terms of BSD licence
#************************************************************************/

#this is an example Makefile for autocreation of PKG_CONFIG



# this is a tweak to avoid using a configure, it's safer to use the test_pkg-config.sh
# test
PKG_CONFIG_INSTALL_DIR?=${DESTDIR}/usr/lib/pkgconfig
#end tweak


PKG_CONFIG= foo+-2.0

export foo_2_0_VERSION=1.2.3
export foo_2_0_DESC=test for pc creation
export foo_2_0_HEADERS_DIR=foo
export foo_2_0_REQUIRES=gtk+-2.0
export foo_2_0_LIBS=

include ${confiserie}/pkg-config/Makefile.pc
include ${confiserie}/../Makefile.confiserie


