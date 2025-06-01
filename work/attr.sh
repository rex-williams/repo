#!/bin/sh -e
set -x
version="2.5.2"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/attr-$version.tar.gz" -C "$TMPDIR"
cd $TMPDIR/attr-$version
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.2
make
make check
make install
