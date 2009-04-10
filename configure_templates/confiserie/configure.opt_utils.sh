#!/bin/sh
# (C) 2005-2005 MALET Jean-Luc aka cityhunter
#this file is provided under the thermes of the BSD licence, you can use it, modify it
#include it into your commercial software as you want


# the utilies optional for running the programm,note the abscence of && 
test_optional_utils() {

  test "true" = "TEST_FEATUREZ" && ${confiserie}/test1.sh 
  ${confiserie}/test2.sh 
  ....
  ${confiserie}/testn.sh
}


