#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/
IFS=$'\n'
while [ "$#" -gt 0 ]; do
        if echo $1 | grep '\.dev/$'; then
                RELDIR=$(echo $1 | sed "s:\.dev/$::")-$(cat $1/version)
                cp -Rp $1 $RELDIR 
                #chown -R root\:root $RELDIR
                find $RELDIR -type f -name "upload.sh" |xargs -i rm -rf "{}"  
                find $RELDIR -type d -name "CVS" |xargs -i rm -rf "{}"  
                find $RELDIR -type d -name ".svn" |xargs -i rm -rf "{}"  
                tar -cjvf $RELDIR.tar.bz2 $RELDIR
                rm -rf $RELDIR
        else
                echo "not a devel directory can't make a release"i
                exit 1
        fi
        shift
done

