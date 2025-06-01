#!/bin/sh -e
set -x
version="1.3.1"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/zlib-$version.tar.gz" -C "$TMPDIR"
cd $TMPDIR/zlib-$version
./configure --prefix=/usr
make
make check
make install
