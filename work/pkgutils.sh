#!/bin/sh -e
set -x
version="5.40.9"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf /sources/pkgutils-$version.tar.xz -C "$TMPDIR"
cd $TMPDIR/pkgutils-$version
sed -i -e 's/ --static//' -e 's/ -static//' Makefile
make
make install
