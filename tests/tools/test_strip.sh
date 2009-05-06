#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/


mytest() {
  test_strip() {
    echo "test_strip.sh: testing striping">&2
    RESULT=false
    if [ -n "$STRIP" ]; then 
      STRIP=$WHICH strip
    fi

  }

  WHICH=${WHICH:=which}

  echo $TEST_SEPARATOR>&2

  test_strip
  if [ -x "$STRIP" ]; then
    echo "STRIP=$STRIP" 
    exit 0
  else
    echo "$STRIP not usable">&2
    exit 1
  fi
}

mytest

