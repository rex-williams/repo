#!/bin/sh -e
version="2.14.2"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf /sources/libxml2-$version.tar.xz -C "$TMPDIR"
cd $TMPDIR/libxml2-$version
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-static  \
            --with-history    \
            --with-icu        \
            PYTHON=/usr/bin/python3 \
            --docdir=/usr/share/doc/libxml2-2.14.3 &&
make
make install
