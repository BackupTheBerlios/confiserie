#!/bin/sh
# (C) 2005-2005 MALET Jean-Luc aka cityhunter
#this file is provided under the thermes of the BSD licence, you can use it, modify it
#include it into your commercial software as you want


#the utilies required for running the programm
test_run_utils() {
  ${confiserie}/test1.sh &&
  ${confiserie}/test2.sh &&
  ....                 &&
  ${confiserie}/testn.sh
}
