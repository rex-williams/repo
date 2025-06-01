#!/bin/sh -e
set -x
version="1.25.0"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/wget-$version.tar.gz" -C "$TMPDIR"
cd $TMPDIR/wget-$version
./configure --prefix=/usr      \
            --sysconfdir=/etc  \
            --with-ssl=openssl
make
make check
make install
