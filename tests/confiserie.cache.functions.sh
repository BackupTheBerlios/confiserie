#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/


conf_cache() {
	eval export $1=\$$1
	eval echo "export $1=\\\"\$$1\\\"" >> .config.cache.new
	eval echo "export $1=\"\$$1\"" 
	eval echo "$1=\$$1" >&2
}

