#!/bin/sh -
#
# field - print fields
#
# Print fields, where fields are seperated by white space.  Blank
# lines are ignored.  Fields that do not exist are ignored.
#
# usage: field [item] ...
#
#	item == 3	=> 3rd field
#	item == e	=> last field
#	item == e-2	=> third from last field
#	else		=> print item
#
# @(#) $Revision: 1.1 $
# @(#) $Id: fld.sh,v 1.1 1999/09/26 22:19:05 chongo Exp chongo $
# @(#) $Source: /usr/local/src/cmd/fld/RCS/fld.sh,v $
#
# Copyright (c) 1989 by Landon Curt Noll.  All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby granted,
# provided that the above copyright, this permission notice and text
# this comment, and the disclaimer below appear in all of the following:
#
#       supporting documentation
#       source copies
#       source works derived from this source
#       binaries derived from this source or from derived source
#
# LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
# INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
# EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
# CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
# USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#
# chongo <was here> /\oo/\
#
# Share and enjoy!

# convert args to awk directives
#
if [ $# -ne 0 ]; then
    col=`echo $@ | \
         sed -e 's/[	 ]/  /g' -e 's/^/ /' \
	     -e 's/$/ /' \
	     -e 's/ 0[^ ]* / 1 /g' \
	     -e 's/ e / 0 /g' \
	     -e 's/ e-\([0-9][0-9]*\) / 0\1 /g' \
	     -e 's/ \([0-9]*[^ 0-9][^ ]*\) / printf \"%s \",\"\1\"; /g' \
	     -e 's/ 0 / printf \"%s \",$NF; /g' \
	     -e 's/ 0\([0-9][0-9]*\) / if(NF>\1)printf \"%s \",$(NF-\1); /g' \
	     -e 's/ \([0-9][0-9]*\) / if(\1<=NF)printf \"%s \",$\1; /g' \
	     -e 's/%s \([^%]*\)$/%s\1/'`
else
    col='print $1;'
fi

# awk to print fields
awk "/./ {$col; printf "'"\n"'";}"
