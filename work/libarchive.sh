#!/bin/sh -e
version="3.8.0"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf /sources/libarchive-$version.tar.xz -C "$TMPDIR"
cd $TMPDIR/libarchive-$version
./configure --prefix=/usr &&
make
make check
make install
ln -sfv bsdunzip /usr/bin/unzip
