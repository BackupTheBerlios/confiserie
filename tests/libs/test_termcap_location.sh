#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/

mytest() {
  ncurse_dir() {
    ${confiserie}/test_c_headers.sh ncurses/termcap.h &&
    echo "TERMCAP_DIR=ncurses/" &&
    export TERMCAP_DIR=ncurses/
  }

  include_dir() {
    ${confiserie}/test_c_headers.sh termcap.h &&
    echo "TERMCAP_DIR="  &&
    export TERMCAP_DIR=
  }

  ncurse_dir || include_dir || return 1
}

mytest

