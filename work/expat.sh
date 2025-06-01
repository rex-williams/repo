#!/bin/sh -e
set -x
version="2.7.1"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/expat-$version.tar.xz" -C "$TMPDIR"
cd $TMPDIR/expat-$version
./configure --prefix=/usr \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.6.4
make
make install
install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.6.4
