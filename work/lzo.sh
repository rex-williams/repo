#!/bin/sh -e
version="2.10"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf /sources/lzo-$version.tar.gz -C "$TMPDIR"
cd $TMPDIR/lzo-$version
./configure --prefix=/usr    \
            --enable-shared  \
            --docdir=/usr/share/doc/lzo-2.10 &&
make
make install
