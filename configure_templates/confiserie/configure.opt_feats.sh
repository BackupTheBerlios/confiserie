#!/bin/sh
# (C) 2005-2005 MALET Jean-Luc aka cityhunter
#this file is provided under the thermes of the BSD licence, you can use it, modify it
#include it into your commercial software as you want


#the features optionally required, same remarks as configure.opt_utils.sh
test_optional_feats() {

  test "true" = "TEST_FEATUREX" && ${confiserie}/test1.sh 
  ${confiserie}/test2.sh 
  ....
  ${confiserie}/testn.sh
} 

