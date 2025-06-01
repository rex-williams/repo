#!/bin/sh -e
set -x
version="4.20.0"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/libtasn1-$version.tar.gz" -C "$TMPDIR"
cd $TMPDIR/libtasn1-$version
./configure --prefix=/usr \
            --disable-static
make
make check
make install
make -C doc/reference install-data-local
