#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/

#pass to this script a list of include stripped of it's #include < >
#ie a #include <toto.h> should be passed as toto.h
#double quote your variables if a space is inside the < >
#multiple includes can be passed with a single call


mytest() {
  AWK=${AWK:=awk}

  $AWK '{gsub(" ","\n");print;}' <&0 |
  $AWK '{FS=" "
         gsub("\\.","_"); 
         gsub("/","_");
         $0=toupper($0); 
         printf("#define HAVE_%s\n",$0);}' 
}

mytest
    
