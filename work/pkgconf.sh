#!/bin/sh -e
set -x
version="2.3.0"
TMPDIR="/tmp/build"
[ -d "$TMPDIR" ] || mkdir "$TMPDIR"
tar xvf /sources/pkgconf-$version.tar.xz -C "$TMPDIR"
cd $TMPDIR/pkgconf-$version
./configure --prefix=/usr              \
            --docdir=/usr/share/doc/pkgconf-2.3.0
make
make install
ln -sv pkgconf   /usr/bin/pkg-config
ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1
