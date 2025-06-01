#!/bin/sh -e
set -x
version="1.13"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/gzip-$version.tar.xz" -C "$TMPDIR"
cd $TMPDIR/gzip-$version
./configure --prefix=/usr
make
make check
make install
