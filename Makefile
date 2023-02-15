#!/usr/bin/make
#
# fld - print a field or fields from stdin
#
# @(#) $Revision: 1.3 $
# @(#) $Id: Makefile,v 1.3 2000/02/18 14:44:51 chongo Exp $
# @(#) $Source: /usr/local/src/bin/fld/RCS/Makefile,v $
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

SHELL=/bin/sh
BINMODE=0555
DESTBIN=/usr/local/bin
INSTALL= install

all: fld

fld: fld.sh
	-rm -f $@
	cp $@.sh $@
	chmod +x $@

install: all
	${INSTALL} -c -m ${BINMODE} fld ${DESTBIN}/fld

clean:

clobber: clean
	-rm -f fld
