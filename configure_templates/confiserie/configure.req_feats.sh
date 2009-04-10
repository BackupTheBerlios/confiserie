#!/bin/sh
# (C) 2005-2005 MALET Jean-Luc aka cityhunter
#this file is provided under the thermes of the BSD licence, you can use it, modify it
#include it into your commercial software as you want

test_required_feats() {
  ${confiserie}/test_c_1.sh &&
  ${confiserie}/test_c_2.sh &&
  ${confiserie}/test_c_3.sh &&
  ....                    &&
  ${confiserie}/test_c_n.sh 

}


