#!/bin/sh -e
set -x
version="2.3.2"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf "/sources/acl-$version.tar.xz" -C "$TMPDIR"
cd $TMPDIR/acl-$version
./configure --prefix=/usr         \
            --docdir=/usr/share/doc/acl-2.3.2
make
make check
make install
